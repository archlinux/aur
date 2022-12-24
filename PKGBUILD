pkgname=mrcpp-git
pkgver=r1025.134cf94
pkgrel=1
pkgdesc="MultiResolution Computation Program Package"
arch=(x86_64)
url="https://github.com/MRChemSoft/mrcpp"
license=(LGPL)
depends=(eigen blas openmp openmpi)
makedepends=(cmake)
provides=(mrcpp)
conflicts=(mrcpp)
source=($pkgname::git+https://github.com/MRChemSoft/mrcpp)
sha256sums=('SKIP')

pkgver(){
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd $pkgname
    cmake -S. -Bbuild -DENABLE_MPI=True -DENABLE_OPENMP=True -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/"
    cmake --build build -j`getconf _NPROCESSORS_ONLN`
}

check(){
    cd $pkgname
    ctest --test-dir build -j`getconf _NPROCESSORS_ONLN`
}

package(){
    cd $pkgname
    cmake --install build --prefix $pkgdir/usr/
    install -d $pkgdir/usr/share/MRCPP/cmake
    mv $pkgdir/usr/share/cmake/MRCPP/* $pkgdir/usr/share/MRCPP/cmake
    rm -rf $pkgdir/usr/share/cmake/MRCPP
}
