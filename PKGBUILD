# Maintainer: sem.z <sem.z at protonmail dot com>

pkgname="orca-slicer-unstable-bin"
pkgver=2.3.0
_pkgver=2.3.0
pkgrel=1
pkgdesc="G-code generator for 3D printers (all versions including alpha, beta, release candidates and stable versions)"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'webkit2gtk-4.1' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'gst-plugins-base' 'gst-libav')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=("https://github.com/SoftFever/OrcaSlicer/releases/download/v${_pkgver}/OrcaSlicer_Linux_AppImage_Ubuntu2404_V${_pkgver}.AppImage")
sha512sums=('2a9def84723f8d362d0c29b1618d045a49e2f0b4008f351e1174c8f699154a84386bc6f31aa1f095391a43613f84a5d1308c2bb125b4530219c24580c83667f2')

prepare() {
	chmod +x OrcaSlicer_Linux_AppImage_Ubuntu2404_V${_pkgver}.AppImage
	./OrcaSlicer_Linux_AppImage_Ubuntu2404_V${_pkgver}.AppImage --appimage-extract

	sed -i 's|Exec=AppRun|Exec=/opt/orca-slicer-unstable/bin/orca-slicer|g' \
		"squashfs-root/OrcaSlicer.desktop"
}

package() {
	find squashfs-root/{resources,usr/share/icons}/ -type d -exec chmod 755 {} +

	install -d "$pkgdir/opt/${pkgname%-bin}/"
	cp -av squashfs-root/* "$pkgdir/opt/${pkgname%-bin}/"
	rm -rf "$pkgdir/opt/${pkgname%-bin}/usr/"
	rm "$pkgdir/opt/${pkgname%-bin}"/{OrcaSlicer.desktop,AppRun,OrcaSlicer.png,OrcaSlicer-x86_64.AppImage}

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname%-bin}/bin/orca-slicer" "$pkgdir/usr/bin/"

	install -Dm644 "squashfs-root/OrcaSlicer.desktop" -t \
		"$pkgdir/usr/share/applications/"

	install -d "$pkgdir/usr/share/icons/"
	cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}
