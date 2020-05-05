# Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=mrchem
pkgver=1.0.0_alpha1
pkgrel=1
epoch=
pkgdesc="MRChem: MultiResolution Chemistry"
arch=("x86_64")
url="https://mrchem.readthedocs.io"
license=("GPL")
groups=()
depends=(openmpi python python-parselglossy python-runtest)
makedepends=(cmake)
checkdepends=()
optdepends=()
provides=(mrchem)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MRChemSoft/mrchem/archive/v1.0.0-alpha1.tar.gz")
noextract=()
sha256sums=("56a7b1677cc1e27d5875ef1e63012c19a314b1bc77dad7032dc70387158cf0f4")
validpgpkeys=()

build() {
	cd "$srcdir/$pkgname-${pkgver//_/-}"
    if [ -d build ]; then
        rm -rf build
    fi
    mkdir build
    ./setup --omp --mpi --cxx=mpicxx --prefix="$pkgdir/" build
	cd "$srcdir/$pkgname-${pkgver//_/-}/build"
	make -j`getconf _NPROCESSORS_ONLN`
}

check() {
	cd "$srcdir/$pkgname-${pkgver//_/-}/build"
    #export DIRAC_MPI_COMMAND="mpirun -n 2"
    ctest -L unit -j4
    ctest -L integration -j4
}

package() {
	cd "$srcdir/$pkgname-${pkgver//_/-}/build"
	make install
}
