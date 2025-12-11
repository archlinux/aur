pkgname=phd2
pkgver=2.6.14
pkgrel=1
pkgdesc="Open PHD Guiding - PHD2 astrophotography autoguiding tool"
url="http://openphdguiding.org/"
arch=('i686' 'x86_64' 'aarch64')
license=('BSD3')
depends=(
	'wxwidgets-gtk3'
	'v4l-utils'
	'zlib'
	'cfitsio'
	'opencv'
	'libnova'
	'libindi'
	'qt6-base'
	'hdf5'
	'vtk'
	'jsoncpp'
	'glew'
	'fmt')
makedepends=('git' 'cmake' 'gtest' 'eigen')
source=("https://github.com/OpenPHDGuiding/phd2/archive/v${pkgver}.zip")
sha256sums=('3d52c913086955ee2473330fa5c778763372b78db1c4da8bd8f03fb02ba0e7cf')

prepare() {
	if [ -d build ]; then
		rm -rf build
	fi
	mkdir build
	cd build

	cmake \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-DUSE_SYSTEM_LIBINDI=ON \
		-DUSE_SYSTEM_LIBUSB=ON \
		-DUSE_SYSTEM_GTEST=ON \
		-DEIGEN_SRC=/usr/include/eigen3 \
		../phd2-$pkgver
}

build() {
	cd build
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
	rm -rf $pkgdir/usr/include
}
