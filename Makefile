BINARY_NAME = password-generator

.SILENT:
.PHONY: default clean updpkgsums

default: updpkgsums

clean:
	@echo "Cleaning up build artifacts..."
	@rm -f $(BINARY_NAME) *.pkg.tar.zst *.tar.gz
	@rm -rf pkg src
	@echo "Cleanup complete."

updpkgsums:
	@echo "Updating pkgsums..."
	@updpkgsums
	@makepkg --printsrcinfo > .SRCINFO
