# Maintainer: Luigi Pertoldi <gipert@pm.me>
pkgbase=bxdecay0
pkgname=('bxdecay0' 'bxdecay0-geant4')
pkgver=1.1.0
pkgrel=1
pkgdesc='C++ port of the legacy Decay0 FORTRAN library'
url="https://github.com/BxCppDev/bxdecay0"
license=('GPL')
arch=('x86_64')
depends=('gsl')
makedepends=('cmake')
provides=('libBxDecay0.so' 'bxdecay0-config' 'bxdecay0-run')
source=("https://github.com/BxCppDev/${pkgbase}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f10fc4ae1783ff0118f2f75ad9156222a5b05f6825eb1419132f4231392cbf70')

_package() {

    [[ "$1" == "geant4-ext" ]] && opt=ON || opt=OFF
    [[ "$1" == "geant4-ext" ]] && builddir=build-g4 || builddir=build

    cmake -B ${builddir} -S "${pkgbase}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBXDECAY0_WITH_GEANT4_EXTENSION=${opt} \
        -Wno-dev

    make -C ${builddir}
    make -C ${builddir} test
    make -C ${builddir} DESTDIR="$pkgdir/" install
}

package_bxdecay0() {
    conflicts=('bxdecay0-geant4')

    _package
}

package_bxdecay0-geant4() {
    depends+=('geant4')
    conflicts=('bxdecay0')
    provides+=('libBxDecay0_Geant4.so')

    _package geant4-ext
}
