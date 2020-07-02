# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Roman Kupriyanov <mr.eshua@gmail.com>

pkgname=jitsi-meet-desktop
pkgver=2.3.0
pkgrel=1
pkgdesc="Jitsi Meet desktop application"
arch=('x86_64')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
conflicts=('jitsi-meet-electron-bin'
           'jitsi-meet-electron')
replaces=('jitsi-meet-electron')
depends=('gtk3'
         'libxss'
         'nss')
makedepends=('coreutils'
             'npm')
backup=()

options=(!strip)
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/jitsi/jitsi-meet-electron/archive/v${pkgver}.tar.gz"
        'jitsi-meet-desktop.desktop')
sha256sums=('76b2fc6c3fba492f07fc08d6d57acd181425ebc4a06ceb16918a9ba42145aae2'
            '6b718d4cd130bb641ba38fa5893f5aec39ae6ab8770384cc6e1f5eaaa7b791d8')

prepare() {
	cd jitsi-meet-electron-${pkgver}/

	# TODO: create a package for jitsi-meet-elecctron-utils and depend on it instead
	# of letting this pull it down from git.
	# TODO: find a way to depend on system electron.
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
		install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/jitsi-meet-desktop.png"
	done

	install -d     "${pkgdir}/usr/bin"
	ln -s          "/opt/${pkgname}/jitsi-meet" "${pkgdir}/usr/bin/jitsi-meet"

	install -d     "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
