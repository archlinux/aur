# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=freifunk-meet-desktop
pkgver=2.0.23
pkgrel=1
pkgdesc="Freifunk Meet desktop application"
arch=('x86_64')
url="https://github.com/freifunkMUC/jitsi-meet-electron"
license=('Apache')
conflicts=('freifunk-meet-desktop-bin')
replaces=('freifunk-meet-desktop-bin')
depends=('gtk3'
         'libxss'
         'nss')
makedepends=('coreutils'
             'npm')
backup=()

options=(!strip)
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/freifunkMUC/jitsi-meet-electron/archive/v${pkgver}.tar.gz"
        'freifunk-meet-desktop.desktop')
sha256sums=('dd796a6b60c1cfee0e6edf5964f89672cbd255811dd733cad0d596d2bf4d81f2'
            '855d3b8031bfbb14d4bb02aaa9f2fe40ae77e0cc6eac4f1b918562f85b6c50f7')

prepare() {
	cd jitsi-meet-electron-${pkgver}/

	# TODO: create a pcakage for jitsi-meet-elecctron-utils and depend on it instead
	# of letting this pull it down from git.
	npm install
}

build() {
	cd jitsi-meet-electron-${pkgver}/
	npm run dist
}

package() {
	cd jitsi-meet-electron-${pkgver}/

	install -d     "${pkgdir}/opt/${pkgname}"
	cp -r          dist/linux-unpacked/* "${pkgdir}/opt/${pkgname}"

	for icon in `ls resources/icons/*.png`; do
		size=$(basename $icon)
		size=${size#"icon_"}
		size=${size%".png"}
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
		install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/ffmuc-meet-desktop.png"
	done

	install -d     "${pkgdir}/usr/bin"
	ln -s          "/opt/${pkgname}/ffmuc-meet" "${pkgdir}/usr/bin/ffmuc-meet"

	install -d     "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
