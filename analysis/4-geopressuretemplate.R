# See https://raphaelnussbaumer.com/GeoPressureManual/geopressuretemplate-workflow.html


library(GeoPressureR)

# Run workflow step-by-step for a single tag
id <- "34KB" # Run a single tag
geopressuretemplate_config(id)
tag <- geopressuretemplate_tag(id)
graph <- geopressuretemplate_graph(id)
geopressuretemplate_pressurepath(id)


## Run workflow for all tags
list_id <- tail(names(yaml::yaml.load_file("config.yml", eval.expr = FALSE)), -1)

for (id in list_id){
  geopressuretemplate(id)
}

load("./data/interim/34KB.Rdata")
plot_path(path_most_likely,provider = "Esri.WorldTopoMap")
path_most_likely
plot(tag$map_pressure)

plot_path(path_most_likely, plot_leaflet = F)
graph_set_movement
