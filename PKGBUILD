# Maintainer: Camille 'DrasLorus' Monière <draslorus@draslorus.fr>

pkgname=libmatio-cpp-git
pkgver=r161.949f9e5
pkgrel=1
pkgdesc="A C++ wrapper of the matio library, with memory ownership handling."
arch=('x86_64')
url="https://github.com/dic-iit/matio-cpp"
license=('BSD')
groups=()
depends=('libmatio')
makedepends=('git'
	'cmake')
checkdepends=('catch2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('libmatio-cpp::git+https://github.com/dic-iit/matio-cpp')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "${pkgname%-git}" -DCMAKE_BUILD_TYPE=None \
		-Wno-dev \
		-DCMAKE_GENERATOR="Unix Makefiles" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build -j
}

check() {
	cmake -B build_testing -S "${pkgname%-git}" -DCMAKE_BUILD_TYPE=None \
		-Wno-dev \
		-DCMAKE_GENERATOR="Unix Makefiles" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTING=ON
	cmake --build build_testing -j
	# Test 8 fails because of unsupported v7.3 format
	cd build_testing && ctest -I 1,7,1,9,10,11
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
