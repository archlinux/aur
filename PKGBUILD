# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034

pkgname=neatimage
pkgver=8.4
pkgrel=2
pkgdesc="Best noise reduction fro digital cameras and scanners"
arch=('x86_64')
url="https://ni.neatvideo.com/"
license=('custom')
depends=(bzip2 expat fontconfig freetype2 gcc-libs glib2 glibc graphite harfbuzz libpng libutil-linux libx11 libxau libxcb libxdmcp libxext libxi pcre zlib)
source=('https://ni.neatvideo.com/demo/ni8/sld/NeatImageSL.Demo.Intel64.tgz')
sha512sums=('b7c15ffe5e11ca66eb3b65a443a699c37bcca4abf66a2daf9d9c65f60538bcdb37d4bfe4c2f32f56d187a40669e5884e831946086f7c044586c32904f328c9d4')

package() {
	echo | # “True” silent mode does not appear to do anything…
		./NeatImageSL.Demo.Intel64.run --prefix "$pkgdir"/opt/NeatImage --mode console \
	|| true # … and the installer returns 1 when it succeeds.

	rm "$pkgdir"/opt/NeatImage/uninstall

	install -Dm644 "$pkgdir"/opt/NeatImage/Legal.txt "$pkgdir"/usr/share/licenses/"$pkgname"/Legal.txt
#	install -Dm755 neatimage "$pkgdir"/usr/bin/neatimage
	mkdir -p "$pkgdir"/usr/bin
	echo -e '#!/bin/bash \n cd /opt/NeatImage/ && ./NeatImage "$@"' > "$pkgdir"/usr/bin/NeatImage
	echo -e '#!/bin/bash \n cd /opt/NeatImage/ && ./NeatImageCL "$@"' > "$pkgdir"/usr/bin/NeatImageCL
	chmod +x "$pkgdir"/usr/bin/NeatImage{,CL}
}
