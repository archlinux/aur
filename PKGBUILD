# Maintainer: Gabriel Guldner <gabriel at guldner . eu>

# Contributor: hashworks <mail@hashworks.net>

pkgname=wiki-js-git
pkgver=2.5.170.r23.g06325124
pkgrel=1
pkgdesc="Wiki.js | A modern, lightweight and powerful wiki app built on Node.js"
license=('AGPL3')
arch=('any')
provides=('wiki-js')
depends=('nodejs>=10.12.0')
optdepends=('mariadb' 'postgresql')
makedepends=('yarn' 'npm')
backup=('etc/wiki-js/config.yml')
url='https://github.com/Requarks/wiki'
source=("git+${url}.git"
        "wiki-js.service"
        "wiki-js.sysusers"
)
sha256sums=('SKIP'
            39bfd1390d3f2eba2522d750b89176aeefcdfdd1e3b2ba4d10276f1b7d3c55e8
            4e7fc467c43f5de2d1a355036abccb2ba23a6b10e1a93ae2d645e4352646bd55
)

pkgver() {
	cd "wiki"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "wiki"
	sed -i 's/dataPath: .\/data/dataPath: \/var\/lib\/wiki-js\/data/' config.sample.yml
}

build() {
	cd "wiki"
	npm install
	yarn build
}

package() {
	install -Dm644 "wiki-js.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "wiki-js.sysusers" "${pkgdir}/usr/lib/sysusers.d/wiki-js.conf"

	cd "wiki"
	install -Dm644 -o 5494 -g 5494 "config.sample.yml" "${pkgdir}/etc/wiki-js/config.yml"

	install -Dm644 "package.json" -t "${pkgdir}/usr/lib/wiki-js"
	cp -aR "assets" "server" "node_modules" "${pkgdir}/usr/lib/wiki-js"

	mkdir -p "${pkgdir}/var/lib/wiki-js"
	chown 5494:5494 "${pkgdir}/var/lib/wiki-js"
}
