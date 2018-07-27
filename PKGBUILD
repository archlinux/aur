# Maintainer: sum01 <sum01@protonmail.com>
pkgname=platformfolders
_realpkgname=PlatformFolders
pkgver=4.0.0
pkgrel=2
pkgdesc='A C++ library to look for special directories like "My Documents" and "%APPDATA%" so that you do not need to write Linux, Windows and Mac OS X specific code'
arch=('i686' 'x86_64')
url="https://github.com/sago007/PlatformFolders"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake>=3.1.0' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sago007/PlatformFolders/archive/${pkgver}.tar.gz")
sha512sums=('89bd9b971cff55ddb051ffcf2e1bbf1678ec14c601916d65ebd4d8e46a79cf93f12cbe9c13ebd0417808f35d7031d13274cda78f009a26fbd19d71e13a5e5ac6')
build() {
	mkdir -p "$srcdir/$_realpkgname-$pkgver/build"
	cd "$srcdir/$_realpkgname-$pkgver/build"
	# Install under /usr/lib instead of /usr/lib64
	cmake -DBUILD_SHARED_LIBS=ON -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
	cmake --build .
}
check() {
	mkdir -p "$srcdir/$_realpkgname-$pkgver/build"
	cd "$srcdir/$_realpkgname-$pkgver/build"
	cmake -DBUILD_SHARED_LIBS=ON -DBUILD_TESTING=ON -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
	cmake --build .
	ctest
}
package() {
	cd "$srcdir/$_realpkgname-$pkgver/build"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" install
}
