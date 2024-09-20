# This is an example of a PKGBUILD for splitting packages. Use this as a
# start to creating your own, and remove these comments. For more information,
# see 'man PKGBUILD'. NOTE: Please fill out the license field for your package!
# If it is unknown, then please put 'unknown'.

# Maintainer: Michael Limiero <mike5713 at gmail dot com>
pkgname=('simplebluez' 'simpleble' 'simpledbus' 'python-simplepyble')
pkgbase=simpleble
pkgver=0.7.3
pkgrel=1
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
source=("https://github.com/OpenBluetoothToolbox/SimpleBLE/archive/refs/tags/v${pkgver}.tar.gz"
	"simplebluez.patch")
noextract=()
sha256sums=('b44042e05ef81d7583540eead8076667f57a1294672d6e86b8b7dfa20a9b56d1'
            '4b9c55f90beaea675e072e666d0a999e815d3e1de4c9a8d360f71c40540e31cb')
validpgpkeys=()

prepare() {
	cd "SimpleBLE-$pkgver"
	patch -p2 -i "$srcdir/simplebluez.patch"
}

build() {
	cd "SimpleBLE-$pkgver"
	cmake -S simplebluez -B build_simplebluez -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build_simplebluez -j7
	cmake -S simpleble -B build_simpleble -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build_simpleble -j7
	cmake -S simpledbus -B build_simpledbus -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build_simpledbus -j7
	PIP_REQUIRE_VENV=0 pip install --prefix=pkg --ignore-installed .
	#cmake -S simplersble -B build_simplersble -DCMAKE_INSTALL_PREFIX=/usr
	#cmake --build build_simplersble -j7
}

package_simplebluez() {
	depends=('simpledbus')
	cd "SimpleBLE-$pkgver/build_simplebluez"
	make DESTDIR="$pkgdir/" install
}

package_simpleble() {
	cd "SimpleBLE-$pkgver/build_simpleble"
	make DESTDIR="$pkgdir/" install
}

package_simpledbus() {
	cd "SimpleBLE-$pkgver/build_simpledbus"
	make DESTDIR="$pkgdir/" install
}

package_python-simplepyble() {
	cd "SimpleBLE-$pkgver/"
	mkdir "$pkgdir/usr"
	cp -a pkg/* "$pkgdir/usr/"
}
