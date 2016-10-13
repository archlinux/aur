ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: .SRCINFO verify

.SRCINFO: PKGBUILD
	 makepkg --printsrcinfo > .SRCINFO

# These can all be created during verify
clean:
	rm -rf pkg
	rm -rf src
	rm -f poltroon-*.pkg.tar.xz
	rm -f v*.tar.gz

verify:
	makepkg -f
	namcap PKGBUILD
	namcap *.pkg.tar.xz
	@echo "precheck succeeded.  Run the final check with:"
	@echo ""
	@echo "sudo rkt --net=host --dns=host --insecure-options=image run docker://base/archlinux --interactive=true --exec /pkg/test_in_rkt.sh --volume pkg,kind=host,source=$(ROOT_DIR) --mount volume=pkg,target=/pkg"

.PHONY: verify clean all
