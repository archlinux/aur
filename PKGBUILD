# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=external-solver
pkgname=petsc4foam
pkgver=v2312
pkgrel=1
pkgdesc="Exploration and testing of linear solvers, matrix operations"
arch=(x86_64)
url="https://develop.openfoam.com/modules/${_base}"
license=(GPL-3.0-or-later)
depends=(openfoam-com=${pkgver} petsc hypre)
conflicts=(pets-complex)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('d7b7f1198c8bca471aee5cbb7336ae6afd03d0db9e5760aced04bae1f43ac622838d084f87631334941011751de3e5d932f783eafc439e745ff8c819d4663251')

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
