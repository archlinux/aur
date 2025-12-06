# Maintainer: kneesdev <kneesdev@naver.com>
pkgname=duelsplus
_pkgname=duelsplus
pkgver=2.8.1
pkgrel=1
pkgdesc="Lightweight, custom Minecraft Proxy designed to enhance your experience on Hypixel Duels."
arch=('x86_64')
url="https://duelsplus.com"
license=('MIT')
depends=('fuse2')
options=(!strip !debug)
provides=('duelsplus')
conflicts=('duelsplus-bin')
_appimage="Duels+-${pkgver}-x64.AppImage"
source=("${_appimage}::https://launcher-updates.duelsplus.com/download/flavor/default/${pkgver}/linux_64/${_appimage}")
sha256sums=('02742e599f2aeda17ecb458b9b62d633fee4b08aed970dae2040eab56e0abbce')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
	sed -i -E \
		"s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
		"squashfs-root/Duels+.desktop"
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	install -Dm755 \
		"${srcdir}/${_appimage}" \
		"${pkgdir}/opt/${_pkgname}/${pkgname}.AppImage"

	install -Dm644 \
		"squashfs-root/Duels+.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"

        install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
	install -Dm644 \
    		"squashfs-root/usr/share/icons/hicolor/256x256/apps/duelsplus-launcher.png" \
    		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/duelsplus-launcher.png"

	install -dm755 "${pkgdir}/usr/bin"
        ln -s \
		/usr/bin/duelsplus-launcher \
		"${pkgdir}/usr/bin/duelsplus"
	ln -s \
		"/opt/${_pkgname}/${_pkgname}.AppImage" \
		"${pkgdir}/usr/bin/duelsplus-launcher"
}
