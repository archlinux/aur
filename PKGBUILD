# Maintainer: Gabriel Guldner <gabriel at guldner . eu>

# Contributor: hashworks <mail@hashworks.net>

pkgname=wiki-js
_pkgname=wiki-js
pkgver=2.5.268
pkgrel=1
pkgdesc="Wiki.js | A modern, lightweight and powerful wiki app built on Node.js"
license=('AGPL3')
arch=('any')
depends=('nodejs>=10.12.0' 'nodejs<17.0.0')
optdepends=('mariadb' 'postgresql')
backup=('etc/wiki-js/config.yml')
url='https://github.com/Requarks/wiki'
source=(
	"wiki-js-${pkgver}.tar.gz::https://github.com/Requarks/wiki/releases/download/${pkgver}/wiki-js.tar.gz"
	"wiki-js.service"
	"wiki-js.sysusers"
	"wiki-js.tmpfiles"
	"config.sample.yml.patch"
)
sha256sums=('11ce2daeb5444db80ab38d5a21ce0d7b4d9cf7af50738e10b6805ff2dca4e3e2'
            '39bfd1390d3f2eba2522d750b89176aeefcdfdd1e3b2ba4d10276f1b7d3c55e8'
            '4e7fc467c43f5de2d1a355036abccb2ba23a6b10e1a93ae2d645e4352646bd55'
            '501ee03026279e6d01736767a590dd97ada35240896fc90a7a7c67c0a890b4d2'
            '0924b4ae73e4787ff50f0f21eb43bb2c41e06a2cc03d841de90f95d570d0e7e3')

prepare() {
	cd "$srcdir"
	patch config.sample.yml ../config.sample.yml.patch
}

package() {
	cd "$srcdir"

	install -Dm644 "wiki-js.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "wiki-js.sysusers" "${pkgdir}/usr/lib/sysusers.d/wiki-js.conf"
	install -Dm644 "wiki-js.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/wiki-js.conf"

	install -Dm644 -g 5494 "config.sample.yml" "${pkgdir}/etc/wiki-js/config.yml"

	install -Dm644 "package.json" -t "${pkgdir}/usr/lib/wiki-js"
	cp -a "assets" "server" "node_modules" "${pkgdir}/usr/lib/wiki-js"
}
