# Maintainer: Borys Kharchenko <borys@kharchenko.work>
pkgname=tascs
pkgver=0.8.0
pkgrel=1
pkgdesc="Personal sticky-note canvas: an infinite board of notes, local-first"
arch=('x86_64')
url="https://tascs.borys.app"
license=('LicenseRef-Tascs')
# the AppImage bundles Electron; only system libraries are needed
depends=('gtk3' 'nss' 'alsa-lib' 'at-spi2-core')
options=('!strip')
noextract=("Tascs-${pkgver}.AppImage")
source=("Tascs-${pkgver}.AppImage::https://tascs.borys.app/dl/Tascs-${pkgver}.AppImage"
        "LICENSE")
sha256sums=('b0b03877456d94d9e9bb5e55ef7f27309699cebb26bb08cf7c1deed8c2f6b81b'
            'SKIP')

prepare() {
	chmod +x "Tascs-${pkgver}.AppImage"
	"./Tascs-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
	cd squashfs-root

	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -a --no-preserve=ownership \
		tascs chrome_crashpad_handler chrome-sandbox *.pak *.dat *.so *.so.1 *.bin *.json \
		locales resources LICENSE.electron.txt LICENSES.chromium.html \
		"${pkgdir}/opt/${pkgname}/"
	# the AppImage squashfs has restrictive modes on some directories
	chmod -R u=rwX,go=rX "${pkgdir}/opt/${pkgname}"
	chmod 755 "${pkgdir}/opt/${pkgname}/tascs" "${pkgdir}/opt/${pkgname}/chrome_crashpad_handler"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/tascs" "${pkgdir}/usr/bin/tascs"

	install -Dm644 tascs.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tascs.png"
	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/tascs.desktop" <<'DESKTOP'
[Desktop Entry]
Name=Tascs
Comment=Personal sticker canvas
Exec=tascs %U
Terminal=false
Type=Application
Icon=tascs
StartupWMClass=tascs
Categories=Utility;
DESKTOP

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
