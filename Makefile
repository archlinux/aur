version = 9add3366d25530d51d168608c54b5339b64d2a4e

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

build:clear ## Build pakage
	makepkg -s

clear: ## Clear files
	rm -rf ./pkg
	rm -rf ./src
	rm -f ./*.zip
	rm -f ./*~
	rm -f ./kget-integrator*

pkgsum: ## update pkgsum with updpkgsums
	updpkgsums

release:clear pkgsum srcinfo ## Release preparation
	git pull

srcinfo: ## génération .SRCINFO
	makepkg --printsrcinfo > .SRCINFO
