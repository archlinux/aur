# Maintainer: sem.z <sem.z at protonmail dot com>

pkgname="orca-slicer-unstable-bin"
pkgver=2.1.0.dev
_pkgver=2.1.0-dev
pkgrel=2
pkgdesc="G-code generator for 3D printers (all versions including alpha, beta, release candidates and stable versions)"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'ttf-harmonyos-sans')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=("https://github.com/SoftFever/OrcaSlicer/releases/download/nightly-builds/OrcaSlicer_Linux_V${_pkgver}.AppImage")
sha512sums=('4273c8406aace1a600cf695ca5d7784c8aeb98a166316ab111e259e84a1a1274394f54151e9eba3fa203cb0a192b30deb3e20d7d3fd65fd702b29d9640631504')

prepare() {
	chmod +x OrcaSlicer_Linux_V${_pkgver}.AppImage
	./OrcaSlicer_Linux_V${_pkgver}.AppImage --appimage-extract

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
