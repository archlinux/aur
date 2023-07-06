# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=decasify
pkgver=0.1.0
pkgrel=1
pkgdesc='convert all-caps strings to title-case supporting Turkish input'
arch=(x86_64)
url="https://github.com/alerque/$pkgname"
license=(GPL3)
depends=(gcc-libs
         glibc)
makedepends=(cargo
             jq)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('d9a02cd9d8fe47119f7d0de50e15c55205de94fae923ace496b159876e4956ec')

prepare() {
	cd "$_archive"
	sed Makefile.am -i \
		-e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
	autoreconf
	cargo fetch --locked
}

build() {
	cd "$_archive"
	./configure --prefix /usr --enable-shared
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
