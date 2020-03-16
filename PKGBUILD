# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=psi4-git-gccmkl
pkgver=master
pkgrel=1
epoch=
pkgdesc="Open-source quantum chemistry"
arch=("x86_64")
url="http://psicode.org"
license=("GPL")
groups=()
depends=(blas lapack boost intel-mkl pybind11)
makedepends=(gcc cmake)
checkdepends=()
optdepends=()
provides=(psi4)
conflicts=(psi4-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/psi4/psi4/archive/master.zip")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "$srcdir"
    export MATH_ROOT=/opt/intel/mkl
    cmake psi4-master -Bbuild -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" \
        -DOpenMP_LIBRARY_DIRS="/opt/intel/mkl/lib" \
        -Dpybind11_DIR="/usr/share/cmake" \
        -DENABLE_ambit="OFF"  \
        -DENABLE_CheMPS2="OFF" \
        -DENABLE_dkh="OFF" \
        -DENABLE_libefp="OFF" \
        -DENABLE_erd="OFF" \
        -DENABLE_simint="OFF" \
        -DENABLE_gdma="OFF" \
        -DENABLE_PCMSolver="OFF" \
        -DENABLE_snsmp2="OFF" \
        -DENABLE_v2rdm_casscf="OFF" \
        -DENABLE_gpu_dfcc="OFF" \
        -DMAX_AM_ERI=5
	cd build
	make -j`getconf _NPROCESSORS_ONLN`
}

check() {
	cd "$srcdir/build"
    ctest -L smoke -j`getconf _NPROCESSORS_ONLN` # Really quick <1min tests
    ctest -L quick -j`getconf _NPROCESSORS_ONLN` # Quick ~10-20 min tests
    #ctest  # complete long tests
}

package() {
	cd "$srcdir/build"
	make install
}
