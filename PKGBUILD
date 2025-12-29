# Maintainer: sum01 <sum01@protonmail.com>
pkgname=platformfolders
_realpkgname=PlatformFolders
pkgver=4.3.0
pkgrel=1
pkgdesc='A C++ library to look for special directories like "My Documents" and "%APPDATA%" so that you do not need to write Linux, Windows and Mac OS X specific code'
arch=('i686' 'x86_64')
url="https://github.com/sago007/PlatformFolders"
license=('MIT')
provides=('libplatform_folders.so')
makedepends=('cmake>=3.5.1' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sago007/PlatformFolders/archive/${pkgver}.tar.gz")
sha512sums=('0c5221581f6cb8ce44ee0200c6a9b9ddb85f1065f0f7dc48b33b8d380483094efba8c089f3d1fc8b6cef51c4f6b70497861e77ac2309a37d1ded9317085a06ae')
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
