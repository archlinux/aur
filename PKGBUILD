# Maintainer: execsuroot <aur@execsuroot.com>
pkgname=minestar-launcher-appimage
pkgver=1.5.1
pkgrel=1
pkgdesc='Minestar Launcher for the minestar project.'
arch=(x86_64)
url='https://minestar.com.ua/'
license=(EULA)
depends=(
	glibc
	hicolor-icon-theme
	zlib
)
provides=(minestar-launcher)
options=(
	!strip     # Stripping symbols would break the AppImage
	!emptydirs # Remove empty directories from package some icon dirs are empty
)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/MinestarUA/launcher-releases/releases/download/v${pkgver}/minestar-launcher-${pkgver}.AppImage")
b2sums_x86_64=("2ad1a434f6bf1adce2a7508af3b308a801577106ba692167767464bd3a3a5b200bbbd3ed4c264621235c273194adba963dce565a33b7aad2cd27d9415fcf06ed")

prepare() {
	cd "${srcdir}"
	chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
	"${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
	chmod -R a-x+rX "${srcdir}/squashfs-root/usr/"
}

build() {
	sed -e 's|Exec=.*|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/minestar-launcher|' \
		-e '$aPath=/usr/bin' \
		-i "${srcdir}/squashfs-root/minestar-launcher.desktop"
}

package() {
	install -Dm755 \
		"${srcdir}/${pkgname}-${pkgver}.AppImage" \
		"${pkgdir}/usr/bin/minestar-launcher"
	install -Dm644 \
		"${srcdir}/squashfs-root/minestar-launcher.desktop" \
		"${pkgdir}/usr/share/applications/minestar-launcher.desktop"

	install -dm755 "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
	cp \
		"${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/minestar-launcher.png" \
		"${pkgdir}/usr/share/icons/hicolor/512x512/apps/minestar-launcher.png"
	install -dm755 "${pkgdir}/usr/lib"
	cp -a \
		"${srcdir}/squashfs-root/usr/lib" \
		"${pkgdir}/usr/share/lib"
}
