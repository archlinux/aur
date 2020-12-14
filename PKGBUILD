# Maintainer: Gabriel Guldner <gabriel at guldner . eu>

# Contributor: hashworks <mail@hashworks.net>

pkgname=wiki-js-git
_pkgname=wiki-js
pkgver=2.5.170.r23.g06325124
pkgrel=1
pkgdesc="Wiki.js | A modern, lightweight and powerful wiki app built on Node.js"
license=('AGPL3')
arch=('any')
depends=('nodejs>=10.12.0')
optdepends=('mariadb' 'postgresql')
makedepends=('yarn' 'npm')
provides=($_pkgname)
conflicts=($_pkgname)
backup=('etc/wiki-js/config.yml')
url='https://github.com/Requarks/wiki'
source=(
	"git+${url}.git"
	"wiki-js.service"
	"wiki-js.sysusers"
	"config.sample.yml.patch"
)
sha256sums=(
	'SKIP'
	39bfd1390d3f2eba2522d750b89176aeefcdfdd1e3b2ba4d10276f1b7d3c55e8
	4e7fc467c43f5de2d1a355036abccb2ba23a6b10e1a93ae2d645e4352646bd55
	0924b4ae73e4787ff50f0f21eb43bb2c41e06a2cc03d841de90f95d570d0e7e3
)

pkgver() {
	cd "$srcdir/wiki"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/wiki"
	patch config.sample.yml ../config.sample.yml.patch
}

build() {
	cd "$srcdir/wiki"
	yarn --frozen-lockfile --non-interactive
	yarn build
  	rm -rf node_modules
  	yarn --production --frozen-lockfile --non-interactive
}

package() {
	cd "$srcdir"

	install -Dm644 "wiki-js.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "wiki-js.sysusers" "${pkgdir}/usr/lib/sysusers.d/wiki-js.conf"

	cd "wiki"
	install -Dm644 -o 5494 -g 5494 "config.sample.yml" "${pkgdir}/etc/wiki-js/config.yml"

	install -Dm644 "package.json" -t "${pkgdir}/usr/lib/wiki-js"
	cp -aR "assets" "server" "node_modules" "${pkgdir}/usr/lib/wiki-js"

	mkdir -p "${pkgdir}/var/lib/wiki-js"
	chown 5494:5494 "${pkgdir}/var/lib/wiki-js"
}
