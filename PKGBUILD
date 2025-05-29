# Maintainer : VCalV

pkgname=neatimage
pkgver=9.3.1
pkgrel=1
pkgdesc="Best noise reduction for digital cameras and scanners"
arch=('x86_64')
url="https://ni.neatvideo.com/"
license=('custom')
depends=(libxcb xcb-util-image xcb-util-keysyms xcb-util-wm xcb-util-renderutil libxkbcommon libxkbcommon-x11 fontconfig freetype2 libx11 libsm libice libxau libxdmcp xcb-util)
makedepends=()
source=(
	$pkgname-$pkgver.tar.gz::https://ni.neatvideo.com/demo/ni9/sld/NeatImage9SL.Demo.Intel64.tgz
	neatimage.desktop
	neatimage.png
	)
sha512sums=('e7c0aa54940ce6bfe11e3dd1e3f93ccf395785ee53c8b182d90ad0c6567a14027b2e49f3392290eca875bd17b94e4d9c4bbbcf795b67a4a389fd23eb075fdd7a'
            '6987c2bbf7abafa1ef76b6896dfa233f61f20d3fd96da39e078b0de18af7c83e36928b4b2fe2fea767d0d46fcdbbb6882e8f5fab10877615f726a2f549d7c84b'
            '5e1ea3aabd6e87275113aea7483967717c65245984f54289943f6102121ed5c935231a611746b5d72e161d43dc5699e1af4ce00ac8946cf18a2f9fd55b51e4d4')

package() {
	./NeatImage9SL.Demo.Intel64.run --prefix "$pkgdir"/opt/NeatImage --mode silent \
	|| true # … and the installer returns 1 when it succeeds.

	rm "$pkgdir"/opt/NeatImage/uninstall

	mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
	mkdir -p "$pkgdir"/usr/share/doc/"$pkgname"

	ln -s /opt/NeatImage/Legal.txt "$pkgdir"/usr/share/licenses/"$pkgname"/Legal.txt

	for docfile in NeatImage.pdf Compatibility.txt ReadMe.txt WhatsNew.txt; do
		ln -s /opt/NeatImage/"$docfile" "$pkgdir"/usr/share/doc/"$pkgname"/"$docfile"
	done;

	mkdir -p "$pkgdir"/usr/bin

	for execfile in NeatImage NeatImageCL; do
		cat > "$pkgdir"/usr/bin/"$execfile" <<<"#!/bin/sh
cd /opt/NeatImage/ && ./$execfile "$@""
		chmod +x "$pkgdir"/usr/bin/"$execfile"
	done

    install -Dt "$pkgdir/usr/share/applications/" "neatimage.desktop"
	install -Dt "$pkgdir/usr/share/pixmaps/" "neatimage.png"

	cd "$pkgdir"/opt/NeatImage/
	ln -s NeatImage9 NeatImage
	ln -s NeatImage9CL NeatImageCL

}
