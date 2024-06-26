# Maintainer: sem.z <sem.z at protonmail dot com>

pkgname="orca-slicer-bin"
pkgver=2.1.1
pkgrel=1
pkgdesc="G-code generator for 3D printers"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'ttf-harmonyos-sans')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=("https://github.com/SoftFever/OrcaSlicer/releases/download/v${pkgver}/OrcaSlicer_Linux_V${pkgver}.AppImage")
sha512sums=('f3e5ee8a8bd1b0c6ad3f8a2ce317d85fb6dd2c6232d89d2cfe1188caa7f2d74e5016b155dd3a4811f3d2369bd9da0e62f9d9a09181776356055101b0fc97d6b1')

prepare() {
	chmod +x OrcaSlicer_Linux_V${pkgver}.AppImage
	./OrcaSlicer_Linux_V${pkgver}.AppImage --appimage-extract

	sed -i 's|Exec=AppRun|Exec=/opt/orca-slicer/bin/orca-slicer|g' \
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
