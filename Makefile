# Makefile for kops-beta-bin PKGBUILD management
# Simplifies .SRCINFO generation and cleanup

.PHONY: srcinfo clean distclean

# Generate .SRCINFO file
srcinfo:
	@echo "Generating .SRCINFO..."
	makepkg --printsrcinfo > .SRCINFO

generate: srcinfo
	@echo "Building package..."
	makepkg

# Clean up generated files
clean:
	@echo "Cleaning up..."
	rm -rf pkg/
	rm -rf src/

# Clean up everything including build artifacts
distclean: clean
	@echo "Doing full cleanup..."
	rm -rf .build/
	rm -rf *.pkg.tar.zst
	rm -rf kops-beta-bin*

# Default target
all: generate

# Help target
help:
	@echo "Available targets:"
	@echo "  srcinfo    - Generate .SRCINFO file"
	@echo "  clean      - Remove build directories"
	@echo "  distclean  - Remove everything including build artifacts"
	@echo "  all        - Generate .SRCINFO (default)"
	@echo "  help       - Show this help"

# Set default target
.DEFAULT_GOAL := all