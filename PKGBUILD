pkgname=psi4-git
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
source=($pkgname::git+https://github.com/psi4/psi4)
md5sums=("SKIP")

pkgver() {
	cd $pkgname
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S. -Bbuild -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/"
	cd build
	make -j`getconf _NPROCESSORS_ONLN`
}

check() {
	#test 243 skipped. See https://github.com/psi4/psi4/issues/2828
	ctest -j`getconf _NPROCESSORS_ONLN` -L quick -E 243
}

package() {
	make install
}
