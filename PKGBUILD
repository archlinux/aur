# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=git-warp-time
pkgver=0.4.3
pkgrel=2
pkgdesc='reset file timestamps to repo state'
arch=(x86_64)
url="https://github.com/alerque/$pkgname"
license=(GPL3)
makedepends=(cargo
             git
             jq)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('5e7824c40241463503beb2236755bf84d97a0af0ad2358fa49ea6d3f3a8ce63a')

prepare() {
	cd "$_archive"
	sed Makefile.am -i \
		-e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
	autoreconf
	cargo fetch --locked
}

build() {
	cd "$_archive"
	./configure --prefix /usr
	make
}

check() {
	cd "$_archive"
	make check
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}
