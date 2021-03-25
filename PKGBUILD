# Maintainer: Camille 'DrasLorus' Monière <draslorus@draslorus.fr>

pkgname=libmatio-cpp
pkgver=0.1.1
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
source=("libmatio-cpp-${pkgver}.tar.gz::https://github.com/dic-iit/matio-cpp/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('8c52ccb08ef31311161eb0f2e348a4d0a170a4b18e1232ff974cf6514a72a706')

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
