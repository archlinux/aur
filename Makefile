######################################################
# makepkg
######################################################

.PHONY: clean
clean:
	rm -rf src pkg sleep-on-lan*

######################################################
# makepkg
######################################################

.PHONY: clean build 
deps: ## build the package
	makepkg -f

.PHONY: build install 
play: ## install the package
	makepkg -si

.PHONY: build srcinfo 
srcinfo: ## build the package srcinfo
	makepkg --printsrcinfo -> .SRCINFO

######################################################
# help
######################################################

.PHONY: help
help: ## show help
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@grep -E '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
        awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ''

