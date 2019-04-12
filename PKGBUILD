# Maintainer: <olegfink@gmail.com>

pkgname=irccloud
pkgver=0.10.0
pkgrel=1
pkgdesc="Chat on IRC from anywhere, and never miss a message"

arch=('arm' 'i686' 'x86_64')
license=('Apache')
url='https://www.irccloud.com/'
depends=('electron')
makedepends=('npm')
source=("irccloud-${pkgver}.tar.gz::https://github.com/irccloud/irccloud-desktop/archive/v${pkgver}.tar.gz"
        "irccloud"
        "irccloud.desktop")
sha256sums=('40b955cd9573a3ad8c598e56d2f34207a3e21611b4465635a9e72f6a6369dc2d'
            '019f90a6bb3ec816a2ac8224b85792025e2885ef7cb451e2d2c70fdd68255acc'
            '2f58dd2b70e6867bfddc216c25f704c4ebd9a427bdcbe4de92b0a2ed06407569')

package(){
	cd "${srcdir}/irccloud-desktop-${pkgver}"
	npm install --production

	install -d "${pkgdir}/usr/lib/irccloud"
	cp -a package.json app node_modules "${pkgdir}/usr/lib/irccloud"
	install -Dm644 "${srcdir}/irccloud.desktop" "${pkgdir}/usr/share/applications/irccloud.desktop"
	install -Dm755 "${srcdir}/irccloud" "${pkgdir}/usr/lib/irccloud/irccloud"

	install -Dm644 './app/tray-icon.png' "$pkgdir/usr/share/icons/hicolor/32x32/apps/irccloud.png"
	install -Dm644 './app/tray-icon@2x.png' "$pkgdir/usr/share/icons/hicolor/64x64/apps/irccloud.png"
	install -Dm644 './app/tray-icon@4x.png' "$pkgdir/usr/share/icons/hicolor/128x128/apps/irccloud.png"
	install -Dm644 './app/icon.png' "$pkgdir/usr/share/icons/hicolor/256x256/apps/irccloud.png"

	install -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/irccloud/irccloud" "${pkgdir}/usr/bin/irccloud"

	# npm leaves a bunch of directories as world writable; this is a workaround
	# to ensure these don’t enter the file system.
	chmod -R go-w "$pkgdir"
}
