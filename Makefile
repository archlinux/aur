.PHONY: all
all:

.PHONY: build
## build: Build package
build:
	@echo "Building..."
	@makepkg --syncdeps --rmdeps

.PHONY: install
## install: Install package
install:
	@echo "Installing..."
	@makepkg --syncdeps --install --rmdeps

.PHONY: sum
## sum: Update the .SRCINFO file
sum:
	@makepkg --geninteg

.PHONY: srcinfo
## srcinfo: Update the .SRCINFO file
srcinfo:
	@echo "Updating srcinfo..."
	@makepkg --printsrcinfo >| .SRCINFO

.PHONY: clean
## clean: Clean up build artifacts
clean:
	@echo "Cleaning..."
	@rm -rf devc-* pkg/ src/

.PHONY: help
## help: Prints this help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'
