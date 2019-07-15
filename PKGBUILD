# Maintainer: <olegfink@gmail.com>

pkgname=irccloud
pkgver=0.12.0
pkgrel=1
pkgdesc="Chat on IRC from anywhere, and never miss a message"

arch=('arm' 'i686' 'x86_64')
license=('Apache')
url='https://www.irccloud.com/'
depends=('electron')
makedepends=('yarn')
source=("irccloud-${pkgver}.tar.gz::https://github.com/irccloud/irccloud-desktop/archive/v${pkgver}.tar.gz"
        "irccloud")
sha256sums=('bbcf0c1889dc52b5f89623090969cdb7d877b92212a2a276dc27abc89587f650'
            '20d71c6232b4479bbb33fa4eca96aed8202a75d28c2325906253150c66888a63')

build(){
	cd "${srcdir}/irccloud-desktop-${pkgver}"

	export SHELL=sh  # Workaround for https://github.com/electron-userland/electron-builder/issues/3494
	make node_modules
	yarn run electron-builder --linux deb --config.deb.compression='gz' -c.electronDist /usr/lib/electron -c.electronVersion $(sed s/^v// /usr/lib/electron/version)
}

package(){
	cd "${srcdir}/irccloud-desktop-${pkgver}"

	case "$CARCH" in
	'x86_64')
		_deb_arch='amd64'
		;;
	'i686')
		_deb_arch='i386'
		;;
	*)
		_deb_arch=$CARCH
		;;
	esac

	bsdcpio -i -m --quiet data.tar.gz < "./dist/irccloud-desktop_${pkgver}_${_deb_arch}.deb"
	tar -xzf ./data.tar.gz -C "${pkgdir}" ./{usr,opt/IRCCloud/resources/app.asar}
	install -Dm644 "${pkgdir}/opt/IRCCloud/resources/app.asar" "${pkgdir}/usr/lib/irccloud/app.asar"
	rm -rf "${pkgdir}/opt"
	sed -i -E 's|Exec=/opt/IRCCloud/irccloud|Exec=/usr/bin/electron /usr/lib/irccloud/app.asar|' "${pkgdir}/usr/share/applications/irccloud.desktop"

	install -Dm755 "${srcdir}/irccloud" "${pkgdir}/usr/bin/irccloud"
}
