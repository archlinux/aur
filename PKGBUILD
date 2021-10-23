# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=replxx
pkgver=0.0.4
pkgrel=1
epoch=
pkgdesc="A readline and libedit replacement that supports UTF-8, syntax highlighting, hints and Windows and is BSD licensed."
arch=('x86_64')
url="https://github.com/AmokHuginnsson/replxx"
license=('BSD')
groups=()
depends=('gcc-libs')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=("lib$pkgname.so")
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/release-$pkgver.tar.gz")
sha256sums=('a22988b2184e1d256e2d111b5749e16ffb1accbf757c7b248226d73c426844c4')

prepare() {
	mv -f "$pkgname-release-$pkgver" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	mkdir -p "build"

	sed -i 's/\(set_target_properties(.*\))/\1 VERSION ${PROJECT_VERSION} SOVERSION ${PROJECT_VERSION_MAJOR})/' CMakeLists.txt
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install

	install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
