# Maintainer : VCalV

pkgname=neatimage
pkgver=9.2.3
pkgrel=1
pkgdesc="Best noise reduction for digital cameras and scanners"
arch=('x86_64')
url="https://ni.neatvideo.com/"
license=('custom')
depends=(libxcb xcb-util-image xcb-util-keysyms xcb-util-wm xcb-util-renderutil libxkbcommon libxkbcommon-x11 fontconfig freetype2 libx11 libsm libice libxau libxdmcp xcb-util)
makedepends=()
source=($pkgname-$pkgver.tar.gz::https://ni.neatvideo.com/demo/ni9/sld/NeatImage9SL.Demo.Intel64.tgz)
sha512sums=(6b7308b2dcddbc4cbebc7785630fcf817950467ccaac2fd53c7b06d26df42bb8550afa733f6c67f832207816851d3d517d9c286e8616d36993434aadcd09416e)

package() {
	./NeatImage9SL.Demo.Intel64.run --prefix "$pkgdir"/opt/NeatImage --mode silent \
	|| true # … and the installer returns 1 when it succeeds.

	rm "$pkgdir"/opt/NeatImage/uninstall

	mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
	mkdir -p "$pkgdir"/usr/share/doc/"$pkgname"

	ln -s /opt/NeatImage/Legal.txt "$pkgdir"/usr/share/licenses/"$pkgname"/Legal.txt
	ln -s /opt/NeatImage/NeatImage.pdf "$pkgdir"/usr/share/doc/"$pkgname"/NeatImage.pdf
	ln -s /opt/NeatImage/Compatibility.txt "$pkgdir"/usr/share/doc/"$pkgname"/Compatibility.txt
	ln -s /opt/NeatImage/ReadMe.txt "$pkgdir"/usr/share/doc/"$pkgname"/ReadMe.txt
	ln -s /opt/NeatImage/WhatsNew.txt "$pkgdir"/usr/share/doc/"$pkgname"/WhatsNew.txt
#	install -Dm755 neatimage "$pkgdir"/usr/bin/neatimage
	mkdir -p "$pkgdir"/usr/bin
	cat > "$pkgdir"/usr/bin/NeatImage <<<'#!/bin/sh
cd /opt/NeatImage/ && ./NeatImage "$@"'
	cat > "$pkgdir"/usr/bin/NeatImageCL <<<'#!/bin/sh
cd /opt/NeatImage/ && ./NeatImageCL "$@"'
	chmod +x "$pkgdir"/usr/bin/NeatImage{,CL}

	cd "$pkgdir"/opt/NeatImage/
	ln -s NeatImage9 NeatImage
	ln -s NeatImage9CL NeatImageCL
}
