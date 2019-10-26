# Maintainer: hashworks <mail@hashworks.net>
pkgname=wiki-js-beta-git
pkgver=r1223.b567413f
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
            08607347f362db25839bddee6d52d102431d7a7ec05937c0ab4ad0b47456ee21
)

pkgver() {
	cd "wiki"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "wiki"
	sed -i 's/dataPath: .\/data/dataPath: \/var\/lib\/wiki-js\/data/' config.sample.yml
}

build() {
	cd "wiki"
	yarn build
}

package() {
	install -Dm 644 "wiki-js.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 "wiki-js.sysusers" "${pkgdir}/usr/lib/sysusers.d/wiki-js.conf"

	cd "wiki"
	# https://wiki.archlinux.org/index.php/DeveloperWiki:UID_/_GID_Database
	install -Dm 640 -o 494 -g 494 "config.sample.yml" "${pkgdir}/etc/wiki-js/config.yml"

	install -Dm 644 "package.json" -t "${pkgdir}/usr/lib/wiki-js"
	cp -r "assets" "server" "node_modules" "${pkgdir}/usr/lib/wiki-js"
}
