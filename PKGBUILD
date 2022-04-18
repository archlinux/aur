# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: pingplug <pingplug@foxmail.com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=hipmagma
pkgver=2.6.2
pkgrel=1
pkgdesc="Matrix Algebra on GPU and Multicore Architectures"
arch=('x86_64')
url="https://icl.cs.utk.edu/magma/"
license=('custom')
depends=('blas' 'lapack' 'rocm-hip-sdk')
makedepends=('gcc-fortran' 'cmake' 'ninja')
optdepends=('python: for examples and tests'
            'gcc-fortran: Fortran interface')
_pkgname="magma"
source=("${_pkgname}-${pkgver}.tar.gz::http://icl.cs.utk.edu/projectsfiles/${_pkgname}/downloads/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f7892a14067d92f73714196e4d76e0354c8dc3da80053612ec98965ce6793627')
options=(!lto)

build() {
  cd ${_pkgname}-${pkgver}

  CC=/usr/bin/gcc \
  CXX=/opt/rocm/g++ \
  FC=/usr/bin/gfortran \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DMAGMA_ENABLE_HIP=ON \
    -DCMAKE_CXX_COMPILER=/usr/bin/hipcc
  ninja -C build
}

package() {
  cd "${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -Cbuild install

  install -d "${pkgdir}"/usr/share/magma/example
  cp -r "${srcdir}"/magma-${pkgver}/example/* "${pkgdir}"/usr/share/magma/example/
  install -d "${pkgdir}"/usr/share/magma/testing
  cp -r "${srcdir}"/magma-${pkgver}/testing/* "${pkgdir}"/usr/share/magma/testing/
  install -Dm644 "${srcdir}"/magma-${pkgver}/COPYRIGHT "${pkgdir}"/usr/share/licenses/magma/LICENSE
}

# vim:set ts=2 sw=2 et:
