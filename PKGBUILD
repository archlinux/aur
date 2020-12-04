# Maintainer: Bruno Bollos Correa <bollos@outlook.com.br>

# trilinos-xyce contributors
# Contributor: Cheng Fei Phung <feiphung@hotmail.com>

# trilinos package contributors
# Contributor: Martin Diehl <https://martin-diehl.net>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Jingbei Li <i@jingbei.li>
# Contributor: Simon Pintarelli <simon.pintarelli@gmail.com>
# Contributor: Feng Wang <wanng.fenng@gmail.com>

# Forked from https://aur.archlinux.org/packages/trilinos/

pkgname=trilinos-xyce-serial
pkgver=12.12.1
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="Algorithms for the solution of large-scale scientific problems. Configured to install the package xyce with serial build"
arch=('x86_64')
url="http://trilinos.org"
license=('LGPL3')
depends=('suitesparse')
makedepends=('gcc-fortran' 'cmake')
provides=('trilinos')
conflicts=('trilinos')
source=("https://github.com/trilinos/Trilinos/archive/trilinos-release-$_pkgver.tar.gz")
sha256sums=('5474c5329c6309224a7e1726cf6f0d855025b2042959e4e2be2748bd6bb49e18')

build() {
    cd Trilinos-trilinos-release-"$_pkgver"
    mkdir -p build
    cd build

    cmake .. \
		-G "Unix Makefiles" \
		-DCMAKE_CXX_FLAGS="${CXXFLAGS/-O2/-O3} -fPIC" \
		-DCMAKE_C_FLAGS="${CFLAGS/-O2/-O3} -fPIC" \
		-DCMAKE_Fortran_FLAGS="${FFLAGS/-O2/-O3} -fPIC" \
		-DTrilinos_INSTALL_INCLUDE_DIR="/usr/include/trilinos" \
		-DTrilinos_INSTALL_LIB_DIR="/usr/lib/trilinos" \
		-DCMAKE_MAKE_PROGRAM="make" \
		-DTrilinos_ENABLE_NOX=ON \
		-DNOX_ENABLE_LOCA=ON \
		-DTrilinos_ENABLE_EpetraExt=ON \
		-DEpetraExt_BUILD_BTF=ON \
		-DEpetraExt_BUILD_EXPERIMENTAL=ON \
		-DEpetraExt_BUILD_GRAPH_REORDERINGS=ON \
		-DTrilinos_ENABLE_TrilinosCouplings=ON \
		-DTrilinos_ENABLE_Ifpack=ON \
		-DTrilinos_ENABLE_Isorropia=ON \
		-DTrilinos_ENABLE_AztecOO=ON \
		-DTrilinos_ENABLE_Belos=ON \
		-DTrilinos_ENABLE_Teuchos=ON \
		-DTeuchos_ENABLE_COMPLEX=ON \
		-DTrilinos_ENABLE_Amesos=ON \
		-DAmesos_ENABLE_KLU=ON \
		-DTrilinos_ENABLE_Sacado=ON \
		-DTrilinos_ENABLE_Kokkos=OFF \
		-DTrilinos_ENABLE_ALL_OPTIONAL_PACKAGES=OFF \
		-DTrilinos_ENABLE_CXX11=ON \
		-DTPL_ENABLE_AMD=ON \
		-DAMD_LIBRARY_DIRS="/usr/lib" \
		-DTPL_AMD_INCLUDE_DIRS="/usr/include/suitesparse" \
		-DTPL_ENABLE_BLAS=ON \
		-DTPL_ENABLE_LAPACK=ON \
		-DTPL_ENABLE_MPI=OFF \
		-DBUILD_SHARED_LIBS=OFF \
		-DCMAKE_BUILD_TYPE='None' \
		-Wno-dev


    make VERBOSE=1
}

check() {
    cd Trilinos-trilinos-release-"$_pkgver"/build
    ctest
}

package() {
    cd Trilinos-trilinos-release-"$_pkgver"/build
    make DESTDIR="$pkgdir" install
}
