# Maintainer: AndyHazz <andyhazz at proton dot me>
# Contributor: sem.z <sem.z at protonmail dot com>

pkgname="orca-slicer-unstable-bin"
pkgver=2.5.0
_pkgver=2.5.0
pkgrel=1
pkgdesc="G-code generator for 3D printers (all published versions - alpha/beta/release candidates and stable)"
arch=('x86_64')
url="https://github.com/OrcaSlicer/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('libmspack' 'glu' 'cairo' 'gtk3' 'webkit2gtk-4.1' 'gstreamer' 'wayland' 'gst-plugins-base' 'gst-libav' 'ttf-nanum' 'gst-plugins-good')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=("https://github.com/OrcaSlicer/OrcaSlicer/releases/download/v${_pkgver}/OrcaSlicer_Linux_AppImage_Ubuntu2404_V${_pkgver}.AppImage")
sha512sums=('dd4db16a4ee1d21aa267cc524942a56e47a81a44c84746f15fc322b06966ca09333d4bf9d85ff5f44e15ccc67a011a54382bba019eb622f3e1812fd2717f7041')
options=('!strip' '!debug')

prepare() {
	chmod +x OrcaSlicer_Linux_AppImage_Ubuntu2404_V${_pkgver}.AppImage
	./OrcaSlicer_Linux_AppImage_Ubuntu2404_V${_pkgver}.AppImage --appimage-extract

	sed -i 's|Exec=.*|Exec=/usr/bin/orca-slicer %U|g' \
		squashfs-root/*.desktop
}

package() {
	find squashfs-root/ -type d -exec chmod 755 {} +

	install -d "$pkgdir/opt/${pkgname%-bin}/"
	cp -a squashfs-root/* "$pkgdir/opt/${pkgname%-bin}/"
	rm -rf "$pkgdir/opt/${pkgname%-bin}/usr/"
	rm -f "$pkgdir/opt/${pkgname%-bin}"/*.desktop
	rm -f "$pkgdir/opt/${pkgname%-bin}"/{AppRun,OrcaSlicer.png}

	# Launch through the bundled env script: it puts lib/orca-runtime (private
	# ffmpeg/python libs) on LD_LIBRARY_PATH, which the bare binary can't find
	install -d "$pkgdir/usr/bin"
	printf '#!/bin/sh\nexec /opt/%s/libexec/orca-slicer-env /opt/%s/bin/orca-slicer "$@"\n' \
		"${pkgname%-bin}" "${pkgname%-bin}" > "$pkgdir/usr/bin/orca-slicer"
	chmod 755 "$pkgdir/usr/bin/orca-slicer"

	install -d "$pkgdir/usr/share/applications"
	install -m644 squashfs-root/*.desktop \
		-t "$pkgdir/usr/share/applications/"

	install -d "$pkgdir/usr/share/icons/"
	cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}
