# Maintainer: <olegfink@gmail.com>

pkgname=irccloud
pkgver=0.10.0
pkgrel=2
pkgdesc="Chat on IRC from anywhere, and never miss a message"

arch=('arm' 'i686' 'x86_64')
license=('Apache')
url='https://www.irccloud.com/'
depends=('electron')
makedepends=('yarn')
source=("irccloud-${pkgver}.tar.gz::https://github.com/irccloud/irccloud-desktop/archive/v${pkgver}.tar.gz"
        "irccloud")
sha256sums=('40b955cd9573a3ad8c598e56d2f34207a3e21611b4465635a9e72f6a6369dc2d'
            '20d71c6232b4479bbb33fa4eca96aed8202a75d28c2325906253150c66888a63')

build(){
	cd "${srcdir}/irccloud-desktop-${pkgver}"

	export SHELL=sh  # Workaround for https://github.com/electron-userland/electron-builder/issues/3494
	make node_modules
	yarn run electron-builder --linux pacman -c.electronDist /usr/lib/electron -c.electronVersion $(sed s/^v// /usr/lib/electron/version)
}

package(){
	cd "${srcdir}/irccloud-desktop-${pkgver}"

	tar -xJf "./dist/irccloud-desktop-${pkgver}.pacman" -C "${pkgdir}" {usr,opt/IRCCloud/resources/app.asar}
	install -Dm644 "${pkgdir}/opt/IRCCloud/resources/app.asar" "${pkgdir}/usr/lib/irccloud/app.asar"
	rm -rf "${pkgdir}/opt"
	sed -i -E 's|Exec="/opt/IRCCloud/irccloud-desktop"|Exec=/usr/bin/electron /usr/lib/irccloud/app.asar|' "${pkgdir}/usr/share/applications/irccloud-desktop.desktop"

	install -Dm755 "${srcdir}/irccloud" "${pkgdir}/usr/bin/irccloud"
}
