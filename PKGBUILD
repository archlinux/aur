# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=git-warp-time
pkgver=0.4.4
pkgrel=1
pkgdesc='reset file timestamps to repo state'
arch=(x86_64)
url="https://github.com/alerque/$pkgname"
license=(GPL3)
makedepends=(cargo
             git
             jq)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('4e285a584756eb75703ac0dfdc5d27759d41cb8575ff0b0a66454429a1c4c021')

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
