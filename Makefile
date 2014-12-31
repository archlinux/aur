.PHONY: package
package: PKGBUILD subsonic-beta.install
	makepkg -f

.PHONY: source
source: PKGBUILD subsonic-beta.install
	makepkg --source

.PHONY: clean
clean:
	rm -f *.tar.gz *.tar.xz *.sig
	rm -rf pkg/ src/

.PHONY: upload
upload: clean source
	aurploader --keep-cookiejar --auto *.src.tar.gz
