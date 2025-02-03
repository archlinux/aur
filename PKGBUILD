# Maintainer: Levitating <me@levitati.ng>
pkgname=incus-ui
pkgver=6.9
pkgrel=1
epoch=
pkgdesc="Incus web interface based on lxd-ui (canonical)"
arch=(any)
url="https://github.com/zabbly/incus-ui-canonical"
license=('GPL')
makedepends=('yarn' 'git' 'npm')
source=("git+https://github.com/zabbly/incus-ui-canonical.git"
        "git+https://github.com/zabbly/incus.git"
        "incus-ui.conf"
)
sha256sums=('SKIP'
            'SKIP'
            'f6f1a4669e7ac2c733544c6ee96ae739f77981184603d36fc8ae906481177bee'
)

prepare() {
	cd "$srcdir/incus-ui-canonical"
	sed -i -f "$srcdir/incus/patches/ui-canonical-renames.sed" src/*/*.ts* src/*/*/*.ts* src/*/*/*/*.ts* src/*/*/*/*/*.ts*
	yarn install
}

build() {
	cd "$srcdir/incus-ui-canonical"
	yarn build
}

package() {
	mkdir -p "$pkgdir/usr/share/incus-ui"
	cp -r "$srcdir/incus-ui-canonical/build/ui/"* "$pkgdir/usr/share/incus-ui"
	install -Dvm 644 "$srcdir/incus-ui.conf" "$pkgdir/usr/lib/systemd/system/incus.service.d/incus-ui.conf"
}
