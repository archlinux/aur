# Maintainer: sum01 <sum01@protonmail.com>
pkgname=platformfolders
_realpkgname=PlatformFolders
pkgver=4.1.0
pkgrel=1
pkgdesc='A C++ library to look for special directories like "My Documents" and "%APPDATA%" so that you do not need to write Linux, Windows and Mac OS X specific code'
arch=('i686' 'x86_64')
url="https://github.com/sago007/PlatformFolders"
license=('MIT')
provides=('libplatform_folders.so')
makedepends=('cmake>=3.1.0' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sago007/PlatformFolders/archive/${pkgver}.tar.gz")
sha512sums=('b2c7983399d9eaa8ef95f45e51b7b70626466fc14a0e53c8b497e683d63e40683cc995c75fc9529c7e969bb802cf9c92051b663901326985722aebf7618c48eb')
build() {
	mkdir -p "$srcdir/$_realpkgname-$pkgver/build"
	cd "$srcdir/$_realpkgname-$pkgver/build"
	# Install under /usr/lib instead of /usr/lib64
	cmake -DBUILD_SHARED_LIBS=ON \
		-DBUILD_TESTING=OFF \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib ..
	cmake --build .
	# Doxygen doesn't want to cooperate from inside the build dir..
	cd ..
	doxygen doxygen.conf
}
check() {
	mkdir -p "$srcdir/$_realpkgname-$pkgver/build"
	cd "$srcdir/$_realpkgname-$pkgver/build"
	cmake -DBUILD_SHARED_LIBS=ON \
		-DBUILD_TESTING=ON \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib ..
	cmake --build .
	ctest
}
package() {
	cd "$srcdir/$_realpkgname-$pkgver/build"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cmake --build . --target install DESTDIR="$pkgdir"
	mkdir -p "$pkgdir/usr/share/doc"
	cp -rf '../doxygen/html' "$pkgdir/usr/share/doc/$pkgname"
}
