# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034

pkgname=neatimage
pkgver=8.6
pkgrel=2
pkgdesc="Best noise reduction fro digital cameras and scanners"
arch=('x86_64')
url="https://ni.neatvideo.com/"
license=('custom')
depends=(bzip2 expat fontconfig freetype2 gcc-libs glib2 glibc graphite harfbuzz libpng libutil-linux libx11 libxau libxcb libxdmcp libxext libxi pcre zlib)
source=('https://ni.neatvideo.com/demo/ni8/sld/NeatImageSL.Demo.Intel64.tgz')
sha512sums=('e002e5f90d3b7d9fe6569ed143b93f0f9931090b8e85fc1d9a14d4d0da219f9ad29ce41c892a9c214237a1eb1de094b01439e87bc46a4ae5c229c667b470aac9')
b2sums=('bcef671427333de0925e66ecc233e01ff57a219d8c0a85871cf2e9dc3f6df24618d2d90afcb6ae3e95bea27d8eba6d198db126b57eac0f7bdba6cc6b589358c1')

package() {
	echo | # “True” silent mode does not appear to do anything…
		./NeatImageSL.Demo.Intel64.run --prefix "$pkgdir"/opt/NeatImage --mode console \
	|| true # … and the installer returns 1 when it succeeds.

	rm "$pkgdir"/opt/NeatImage/uninstall

	install -Dm644 "$pkgdir"/opt/NeatImage/Legal.txt "$pkgdir"/usr/share/licenses/"$pkgname"/Legal.txt
#	install -Dm755 neatimage "$pkgdir"/usr/bin/neatimage
	mkdir -p "$pkgdir"/usr/bin
	cat > "$pkgdir"/usr/bin/NeatImage <<<'#!/bin/bash
cd /opt/NeatImage/ && ./NeatImage "$@"'
	cat > "$pkgdir"/usr/bin/NeatImageCL <<<'#!/bin/bash
cd /opt/NeatImage/ && ./NeatImageCL "$@"'
	chmod +x "$pkgdir"/usr/bin/NeatImage{,CL}
}
