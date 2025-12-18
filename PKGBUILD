# Maintainer: Antoine Gaudreau Simard <antoine at gaudreau dot simard>
# Contributor: Michael Limiero <mike5713 at gmail dot com>
pkgname=('simplebluez' 'simpleble' 'simpledbus' 'python-simplepyble')
pkgbase=simpleble
pkgver=0.10.3
pkgrel=2
epoch=
pkgdesc="The all-in-one Bluetooth library for MacOS, iOS, Windows, Linux and Android"
arch=("x86_64")
url="https://www.simpleble.org/"
license=('GPLv3')
groups=()
depends=()
makedepends=("cmake" "pybind11" "python" "python-pip" "git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("https://github.com/simpleble/simpleble/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('f770c0009f7abaec518e4c715e93fe36f6764a5d495dc6ae683f2695dfd5f9bc')
validpgpkeys=()

build() {
	cd "simpleble-$pkgver"
	cmake -S simplebluez -B build_simplebluez -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build_simplebluez -j7
	cmake -S simpleble -B build_simpleble -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build_simpleble -j7
	cmake -S simpledbus -B build_simpledbus -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build_simpledbus -j7
	PIP_REQUIRE_VENV=0 pip install --prefix=pkg --ignore-installed .
}

package_simplebluez() {
	depends=('simpledbus')
	cd "simpleble-$pkgver/build_simplebluez"
	make DESTDIR="$pkgdir/" install
	# Remove simpledbus files that are provided by the simpledbus package
	rm -rf "$pkgdir/usr/include/simpledbus"
	rm -f "$pkgdir/usr/lib/libsimpledbus"* "$pkgdir/usr/lib/cmake/simpledbus"* "$pkgdir/usr/lib/pkgconfig/simpledbus.pc"
}

package_simpleble() {
	cd "simpleble-$pkgver/build_simpleble"
	make DESTDIR="$pkgdir/" install
}

package_simpledbus() {
	cd "simpleble-$pkgver/build_simpledbus"
	make DESTDIR="$pkgdir/" install
}

package_python-simplepyble() {
	cd "simpleble-$pkgver/"
	mkdir "$pkgdir/usr"
	cp -a pkg/* "$pkgdir/usr/"
}
