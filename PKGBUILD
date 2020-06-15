# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=replxx
pkgver=0.0.2
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
sha256sums=('6f5c58b4cd23550d5a589d134727296438793cb818ce7158fbd5e1b0db1548ba')

prepare() {
	mv -f "$pkgname-release-$pkgver" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	mkdir -p "build"

	sed -i 's/VERSION 3.0/VERSION 3.13.0/' CMakeLists.txt
	sed -i 's/\(set_target_properties(.*\))/\1 VERSION ${PROJECT_VERSION} SOVERSION ${PROJECT_VERSION_MAJOR})/' CMakeLists.txt
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install

	install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
