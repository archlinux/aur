# Maintainer: Sandwich <sandwich at archworks dot co>
# Contributor: Gabriel Guldner <gabriel at guldner . eu>
# Contributor: hashworks <mail@hashworks.net>

pkgname=wiki-js
_pkgname=wiki-js
pkgver=2.5.300
pkgrel=2
pkgdesc="Wiki.js | A modern, lightweight and powerful wiki app built on Node.js"
license=('AGPL3')
arch=('any')
depends=('nodejs>=12.0.0')
optdepends=('mariadb' 'postgresql' 'sqlite')
backup=('etc/wiki-js/config.yml')
url='https://github.com/Requarks/wiki'
source=(
	"wiki-js-${pkgver}.tar.gz::https://github.com/requarks/wiki/releases/download/v${pkgver}/wiki-js.tar.gz"
	"wiki-js.service"
	"wiki-js.sysusers.d"
	"wiki-js.tmpfiles.d"
	"config.sample.yml.patch"
)
sha256sums=('0b272ada8781f2fd3656d13928fb34f7ebb366abc66c9447f89e183c3628fb26'
            '39bfd1390d3f2eba2522d750b89176aeefcdfdd1e3b2ba4d10276f1b7d3c55e8'
            '4e7fc467c43f5de2d1a355036abccb2ba23a6b10e1a93ae2d645e4352646bd55'
            '501ee03026279e6d01736767a590dd97ada35240896fc90a7a7c67c0a890b4d2'
            '02252fa88d1d02bddca7723f5c9a016b7f523587dd1d9695248dec8e63e56e1a')

prepare() {
	cd "$srcdir"
	patch config.sample.yml config.sample.yml.patch
}

package() {
	cd "$srcdir"

	install -Dm644 "wiki-js.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "wiki-js.sysusers.d" "${pkgdir}/usr/lib/sysusers.d/wiki-js.conf"
	install -Dm644 "wiki-js.tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/wiki-js.conf"

	install -Dm644 -o 5494 -g 5494 "config.sample.yml" "${pkgdir}/etc/wiki-js/config.yml"

	install -Dm644 "package.json" -t "${pkgdir}/usr/lib/wiki-js"
	cp -a "assets" "server" "node_modules" "${pkgdir}/usr/lib/wiki-js"
}
