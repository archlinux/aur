# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# `fetch` author: John R. Marino <draco@marino.st>

pkgname=fetch
_gituser=jrmarino
_gitname=fetch-freebsd
pkgver=12.0.9
pkgrel=1
pkgdesc="FreeBSD fetch for Linux"
arch=('x86_64')
url="https://github.com/$_gituser/$_gitname"
license=('BSD-3-Clause')
depends=('libressl')
makedepends=('cmake')
source=("v$pkgver.zip::https://github.com/$_gituser/$_gitname/archive/v$pkgver.zip")
sha256sums=('f6628fcf8887a9e836f3365ed94cbbcf5008a75c0127b2ab096dcf5b07ce74c9')

build() {
	cd "$_gitname-$pkgver"
	cmake -B build -S . -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX="/usr" -Wno-dev -DCMAKE_C_FLAGS="-O3" -DUSE_SYSTEM_SSL=ON -DFETCH_LIBRARY=ON
	make -C build
}

package() {
	cd "$_gitname-$pkgver"
	make DESTDIR="$pkgdir" -C build install
	# Required per https://wiki.archlinux.org/index.php/PKGBUILD#license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
