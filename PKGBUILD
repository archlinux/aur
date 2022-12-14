pkgname=psi4
pkgver=1.7
pkgrel=1
pkgdesc="Open-Source Quantum Chemistry - an electronic structure package in C++ driven by Python"
arch=("x86_64")
url="http://psicode.org"
license=("GPL")
depends=(blas lapack python python-numpy gau2grid eigen
		 pybind11 python-qcelemental python-qcengine libxc
		 python-optking python-msgpack python-networkx)
makedepends=(gcc cmake make)
checkdepends=()
optdepends=(perl python-pytest python-pytest-xdist python-sphinx python-nbsphinx)
provides=(psi4)
source=($pkgname-$pkgver.tar.gz::https://github.com/psi4/psi4/archive/v1.7.tar.gz)
sha256sum=('85a2772a148d57423a909fd91f3f9b068ae393b161510e78e7a824fbe3997366')

build() {
	cmake -S"$pkgname" -Bbuild -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/"
	cd build
	make -j`getconf _NPROCESSORS_ONLN`
}

check() {
	cd "${srcdir}/build"
	#test 243 skipped. See https://github.com/psi4/psi4/issues/2828
	ctest -j`getconf _NPROCESSORS_ONLN` -L quick -E 243
}

package() {
	cd "${srcdir}/build"
	make install
}