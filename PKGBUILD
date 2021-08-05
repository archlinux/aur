# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=git-warp-time-git
pkgver=0.4.3.r1.g690557a
pkgrel=2
pkgdesc='reset file timestamps to repo state'
arch=(x86_64)
url="https://github.com/alerque/${pkgname%-git}"
license=(GPL3)
makedepends=(cargo
             git
             jq)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	sed Makefile.am -i \
		-e "/^licensedir = /s#.(_gwt)\$#$pkgname#" \
		-e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
	./bootstrap.sh
	cargo fetch --locked
}

build() {
	cd "$pkgname"
	./configure --prefix "/usr"
	make
}

check() {
	cd "$pkgname"
	make check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
