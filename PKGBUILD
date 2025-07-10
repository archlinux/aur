# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=external-solver
pkgname=petsc4foam
pkgver=v2412
pkgrel=1
pkgdesc="Exploration and testing of linear solvers, matrix operations"
arch=(x86_64)
url="https://develop.openfoam.com/modules/${_base}"
license=(GPL-3.0-or-later)
depends=(openfoam-com=${pkgver} petsc hypre)
conflicts=(pets-complex)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('0b9f44822dde667f29fca0dce90e78d1ade335fe31b896c62d3b8007414204169f35fbe02fe56de0659244730f4ab5ed3256205a89be42935927a818173e2dee')

prepare() {
  if [ -n "$WM_PROJECT_DIR" ]; then
    echo
    echo -e "\e[1m\e[5m\e[31mPlease make sure that no OpenFOAM version is sourced in bashrc.\e[0m"
    echo
    return 1
  fi
}

package() {
  source /opt/OpenFOAM/OpenFOAM-${pkgver}/etc/bashrc || true
  source /etc/profile.d/petsc.sh
  cd ${_base}-${pkgver}
  ./Allwclean
  ./Allwmake -j -log=log.build -prefix=${pkgdir}${FOAM_LIBBIN}
  mv ${pkgdir}${FOAM_LIBBIN}/lib/libpetscFoam.so ${pkgdir}${FOAM_LIBBIN}
  rmdir ${pkgdir}${FOAM_LIBBIN}/lib
}
