# Maintainer: sum01 <sum01@protonmail.com>
pkgname=platformfolders
_realpkgname=PlatformFolders
pkgver=4.2.0
pkgrel=1
pkgdesc='A C++ library to look for special directories like "My Documents" and "%APPDATA%" so that you do not need to write Linux, Windows and Mac OS X specific code'
arch=('i686' 'x86_64')
url="https://github.com/sago007/PlatformFolders"
license=('MIT')
provides=('libplatform_folders.so')
makedepends=('cmake>=3.1.0' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sago007/PlatformFolders/archive/${pkgver}.tar.gz")
sha512sums=('50a9acd37b8b491e8938190b3b7ed1af2d3cc70bb6e59708dc1928269d5e4b8d52ec02f9330f3d9439099029ac61d193dadbca198e1d561432e02e488e103f7c')
build() {
	mkdir -p "$srcdir/$_realpkgname-$pkgver/build"
	cd "$srcdir/$_realpkgname-$pkgver/build"
	# Install under /usr/lib instead of /usr/lib64
	cmake -DPLATFORMFOLDERS_BUILD_SHARED_LIBS=ON \
		-DPLATFORMFOLDERS_ENABLE_INSTALL=ON \
		-DPLATFORMFOLDERS_BUILD_TESTING=OFF \
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
	cmake -DPLATFORMFOLDERS_BUILD_SHARED_LIBS=ON \
		-DPLATFORMFOLDERS_ENABLE_INSTALL=ON \
		-DPLATFORMFOLDERS_BUILD_TESTING=ON \
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
