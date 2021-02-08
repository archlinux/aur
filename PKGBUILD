# Maintainer: Camille 'DrasLorus' Monière <draslorus@draslorus.fr>

pkgname=libmatio-cpp
pkgver=0.1.0
pkgrel=1
pkgdesc="A C++ wrapper of the matio library, with memory ownership handling."
arch=('x86_64')
url="https://github.com/dic-iit/matio-cpp"
license=('BSD')
groups=()
depends=('libmatio')
makedepends=('cmake')
checkdepends=('catch2')
provides=("$pkgname")
conflicts=("$pkgname-git")
replaces=()
backup=()
options=()
install=
source=('libmatio-cpp-0.1.0.tar.gz::https://github.com/dic-iit/matio-cpp/archive/v0.1.0.tar.gz')
noextract=()
sha256sums=('d5d23bca15fd94c1cf8eb88070ca5f31c180c4cdf17db2c4d1edce865fe65f4c')

prepare() {
	cd "$srcdir"
	mv matio-cpp-"$pkgver" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	cmake -B build -S . -DCMAKE_BUILD_TYPE=None \
                -Wno-dev \
                -DCMAKE_GENERATOR="Unix Makefiles" \
                -DCMAKE_INSTALL_PREFIX=/usr
        cmake --build build -j
}

check() {
	cd "$pkgname-$pkgver"
	cmake -B build_testing -S . -DCMAKE_BUILD_TYPE=None \
                -Wno-dev \
                -DCMAKE_GENERATOR="Unix Makefiles" \
                -DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTING=ON
        cmake --build build_testing -j
	cd build_testing && ctest
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
