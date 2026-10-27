# Maintainer: AndyHazz <andyhazz at proton dot me>
# Contributor: sem.z <sem.z at protonmail dot com>

pkgname="orca-slicer-unstable-bin"
pkgver=2.5.0beta
_pkgver=2.5.0-beta
pkgrel=1
pkgdesc="G-code generator for 3D printers (versions including beta, release candidates and stable versions)"
arch=('x86_64')
url="https://github.com/OrcaSlicer/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('libmspack' 'glu' 'cairo' 'gtk3' 'webkit2gtk-4.1' 'gstreamer' 'wayland' 'gst-plugins-base' 'gst-libav' 'ttf-nanum' 'gst-plugins-good')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=("https://github.com/OrcaSlicer/OrcaSlicer/releases/download/v${_pkgver}/OrcaSlicer_Linux_AppImage_Ubuntu2404_V${_pkgver}.AppImage")
sha512sums=('c4a2e776d975650517541e636f18cb373e0c7ada493f2c8db6cc2fc21d51d6f4a46de264c0be232d7f1bb8600ce535a7ae4a7824ed81b3dd3fecc910c04999ef')
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
