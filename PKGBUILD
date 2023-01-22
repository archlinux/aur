# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# `fetch` author: John R. Marino <draco@marino.st>

pkgname=fetch
_gituser=jrmarino
_gitname=fetch-freebsd
pkgver=12.0.10
pkgrel=1
pkgdesc="FreeBSD fetch for Linux"
arch=('x86_64')
url="https://github.com/$_gituser/$_gitname"
license=('BSD-3-Clause')
depends=('libressl')
makedepends=('cmake')
source=("v$pkgver.zip::https://github.com/$_gituser/$_gitname/archive/v$pkgver.zip")
sha256sums=('3e63a357741079629a71485ea8e4e36c30000dd0ee65df853bfc582c1e7cbe39')

build() {
	cd "$_gitname-$pkgver"
	export CFLAGS="-O3 -DNDEBUG=1"
	cmake -B build -S . -DCMAKE_BUILD_TYPE='Release' -DCMAKE_C_FLAGS="-O3 -DNDEBUG=1" -DCMAKE_INSTALL_PREFIX="/usr" -DUSE_SYSTEM_SSL=ON -DFETCH_LIBRARY=ON
	make -C build
}

package() {
	cd "$_gitname-$pkgver"
	make -C build DESTDIR="$pkgdir" install
	# Required per https://wiki.archlinux.org/index.php/PKGBUILD#license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
