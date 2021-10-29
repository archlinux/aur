# Maintainer: kedap <kedap dot dev at protonmail dot com>

pkgname=devmode-git
_pkgname=devmode
pkgver=1e1be59
pkgrel=2
pkgdesc="Devmode is a code management utility for developers."
arch=('i686' 'x86_64')
url="https://github.com/edfloreshz/devmode"
license=('GPL2')
depends=()
makedepends=('cargo' 'git' 'python-sphinx')
optdepends=()
provides=('devmode')
conflicts=('devmode')
source=("devmode::git+https://github.com/edfloreshz/devmode")
md5sums=('SKIP')

prepare() {
	cd "$_pkgname"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	cd dmd
	cargo build --release --locked
	cd .. && cd dmdt
	cargo build --release --locked
	cd man-pages
	make man
}

package() {
	cd "$_pkgname"
	install -Dm755 dmd/target/release/dmd "$pkgdir"/usr/bin/dmd
	install -Dm644 "dmd/dmd.1" -t "$pkgdir"/usr/share/man/man1
	install -Dm755 dmdt/target/release/dmdt "$pkgdir"/usr/bin/dmdt
	install -Dm644 "dmdt/man-pages/_build/man/dmdt.1" -t "$pkgname"/usr/share/man/man1
}
