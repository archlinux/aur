# Maintainer: Luigi Pertoldi <gipert@pm.me>
pkgbase=bxdecay0-git
_pkgname=bxdecay0
pkgname=('bxdecay0-git' 'bxdecay0-geant4-git')
pkgver=1.0.10.13.g5366e1f
pkgrel=1
pkgdesc='C++ port of the legacy Decay0 FORTRAN library'
url="https://github.com/BxCppDev/bxdecay0"
license=('GPL')
arch=('x86_64')
depends=('gsl')
makedepends=('cmake')
provides=('libBxDecay0.so' 'bxdecay0-config' 'bxdecay0-run')
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/-/./g'
}

_package() {

    [[ "$1" == "geant4-ext" ]] && opt=ON || opt=OFF
    [[ "$1" == "geant4-ext" ]] && builddir=build-g4 || builddir=build

    cmake -B ${builddir} -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBXDECAY0_WITH_GEANT4_EXTENSION=${opt} \
        -Wno-dev

    make -C ${builddir}
    make -C ${builddir} test
    make -C ${builddir} DESTDIR="$pkgdir/" install
}

package_bxdecay0-git() {
    conflicts=('bxdecay0-geant4' 'bxdecay0-geant4-git' 'bxdecay0')

    _package
}

package_bxdecay0-geant4-git() {
    depends+=('geant4')
    conflicts=('bxdecay0' 'bxdecay0-git' 'bxdecay0-geant4')
    provides+=('libBxDecay0_Geant4.so')

    _package geant4-ext
}
