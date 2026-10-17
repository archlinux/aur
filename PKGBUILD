# Maintainer: AndyHazz <andyhazz at proton dot me>
# Contributor: sem.z <sem.z at protonmail dot com>

pkgname="orca-slicer-unstable-bin"
pkgver=2.5.0alpha
_pkgver=2.5.0-alpha
pkgrel=3
pkgdesc="G-code generator for 3D printers (versions including beta, release candidates and stable versions)"
arch=('x86_64')
url="https://github.com/OrcaSlicer/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('libmspack' 'glu' 'cairo' 'gtk3' 'webkit2gtk-4.1' 'gstreamer' 'wayland' 'gst-plugins-base' 'gst-libav' 'ttf-nanum' 'gst-plugins-good')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=("https://github.com/OrcaSlicer/OrcaSlicer/releases/download/v${_pkgver}/OrcaSlicer_Linux_AppImage_Ubuntu2404_V${_pkgver}.AppImage")
sha512sums=('4caf81cf2d46ae0d6fad82ea90043d32a36fa072c5a37f1d4bc0832d11f04bc08d03be37a4f12d4772a8f217d222eefaaaf88589e3a4e3ff81670a6bd433ab96')
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
