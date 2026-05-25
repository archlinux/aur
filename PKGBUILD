# Maintainer: AndyHazz <andyhazz at proton dot me>
# Contributor: sem.z <sem.z at protonmail dot com>

pkgname="orca-slicer-unstable-bin"
pkgver=2.4.0alpha
_pkgver=2.4.0-alpha
pkgrel=2
pkgdesc="G-code generator for 3D printers (versions including beta, release candidates and stable versions)"
arch=('x86_64')
url="https://github.com/OrcaSlicer/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('libmspack' 'glu' 'cairo' 'gtk3' 'webkit2gtk-4.1' 'gstreamer' 'wayland' 'gst-plugins-base' 'gst-libav' 'ttf-nanum' 'gst-plugins-good')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=("https://github.com/OrcaSlicer/OrcaSlicer/releases/download/v${_pkgver}/OrcaSlicer_Linux_AppImage_Ubuntu2404_V${_pkgver}.AppImage")
sha512sums=('1b4a91d1c8aa81962287889a70afcd03e9b009fe25359316abb6f9b92ff3e381aeb9c64d5ccc49d110d9abec904503eac8226fcfbea0bfba582b74aa5ebe933b')
options=('!strip' '!debug')

prepare() {
	chmod +x OrcaSlicer_Linux_AppImage_Ubuntu2404_V${_pkgver}.AppImage
	./OrcaSlicer_Linux_AppImage_Ubuntu2404_V${_pkgver}.AppImage --appimage-extract

	sed -i 's|Exec=.*|Exec=/opt/orca-slicer-unstable/bin/orca-slicer %U|g' \
		squashfs-root/*.desktop
}

package() {
	find squashfs-root/{resources,usr/share/icons}/ -type d -exec chmod 755 {} +

	install -d "$pkgdir/opt/${pkgname%-bin}/"
	cp -a squashfs-root/* "$pkgdir/opt/${pkgname%-bin}/"
	rm -rf "$pkgdir/opt/${pkgname%-bin}/usr/"
	rm -f "$pkgdir/opt/${pkgname%-bin}"/*.desktop
	rm -f "$pkgdir/opt/${pkgname%-bin}"/{AppRun,OrcaSlicer.png}

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname%-bin}/bin/orca-slicer" "$pkgdir/usr/bin/orca-slicer"

	install -d "$pkgdir/usr/share/applications"
	install -m644 squashfs-root/*.desktop \
		-t "$pkgdir/usr/share/applications/"

	install -d "$pkgdir/usr/share/icons/"
	cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}
