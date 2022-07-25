# Maintainer: Camille 'DrasLorus' Monière <draslorus@draslorus.fr>

pkgname=libmatio-cpp
pkgver=0.2.0
pkgrel=2
pkgdesc="A C++ wrapper of the matio library, with memory ownership handling."
arch=('x86_64')
url="https://github.com/dic-iit/matio-cpp"
license=('BSD')
groups=()
depends=('libmatio')
makedepends=('cmake')
checkdepends=('catch2')
provides=("$pkgname" "visit_struct")
conflicts=("$pkgname-git")
replaces=()
backup=()
options=()
install=
source=("libmatio-cpp-${pkgver}.tar.gz::https://github.com/ami-iit/matio-cpp/archive/v${pkgver}.tar.gz"
	"visit_struct.zip::https://github.com/ami-iit/visit_struct/archive/969fc563477906432a9fcc91addf2c1e13c56f4c.zip")
noextract=()
sha256sums=('38703817d0bd8184348d848ed537f0ec14e4c288ac5dc4c2396243afd898d987'
	'3df656403aa1e2969a4c7b8606002014adcfb21123cca209e58c18f3e35d3422')

prepare() {
	cd "$srcdir"
	mv matio-cpp-"$pkgver" "$pkgname-$pkgver"
	mv visit_struct-969fc563477906432a9fcc91addf2c1e13c56f4c visit_struct
}

build() {
	cd "$srcdir/visit_struct"
	cmake -B build -S . -DCMAKE_BUILD_TYPE=None \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX="$srcdir/.local/usr"
    cmake --build build -j
	cmake --build build -t install 
	

	cd "$srcdir/$pkgname-$pkgver"
	cmake -B build -S . -DCMAKE_BUILD_TYPE=None \
                -Wno-dev \
                -DCMAKE_GENERATOR="Unix Makefiles" \
				-DCMAKE_PREFIX_PATH="$srcdir/.local/usr" \
                -DCMAKE_INSTALL_PREFIX=/usr \
				-DBUILD_TESTING=ON
        cmake --build build -j
}

check() {
	cd "$pkgname-$pkgver/build"
	ctest
}

package() {
	cd "$srcdir/visit_struct/build"
	cmake .. -DCMAKE_INSTALL_PREFIX="/usr"
	make && make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/visit_struct/LICENSE" "$pkgdir/usr/share/licenses/visit_struct/LICENSE"
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
