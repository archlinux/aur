# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=decasify
pkgver=0.2.1
pkgrel=1
pkgdesc='cast strings to title-case according to locale specific style guides including Turkish'
arch=(x86_64)
url="https://github.com/alerque/$pkgname"
license=(GPL3)
depends=(gcc-libs
         glibc)
makedepends=(cargo
             jq)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('3fdea580b8e26179ef432f6794a30605d1d350ab47bb850fdde294059c54c936')

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
