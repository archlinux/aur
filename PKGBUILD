# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: pingplug <pingplug@foxmail.com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=hipmagma
pkgver=2.0.0
pkgrel=1
pkgdesc="Matrix Algebra on GPU and Multicore Architectures"
arch=('x86_64')
url="https://icl.cs.utk.edu/magma/"
license=('custom')
depends=('blas' 'lapack' 'rocm' 'rocm-libs')
makedepends=('gcc-fortran' 'cmake' 'ninja')
optdepends=('python: for examples and tests'
            'gcc-fortran: Fortran interface')
source=("${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/icl/magma/get/hipMAGMAv${pkgver}.tar.gz"
        'disable_magma_sparse.patch')
sha256sums=('81a16042b81561155189c1450f08d9282ad1ac1e7212ec5015a2063ee52ba3b2'
            '259c38004b26395278cdaf431591974e0589dedc0f8bfc14413f854c2a10424f')

_dir="icl-magma-dda09490fbae"

prepare() {
  cd ${_dir}

  # Temporarily disable magma-sparse until it's fixed by magma upstream:
  # https://bugs.archlinux.org/task/67094
  patch -Np1 -i "${srcdir}/disable_magma_sparse.patch"
}

build() {
  cd ${_dir}
  mkdir -p build

  cp make.inc-examples/make.inc.hip_openblas make.inc

  export CC=/usr/bin/gcc
  export CXX=/usr/bin/g++
  export FC=/usr/bin/gfortran
  export OPENBLASDIR=/usr

  make -f make.gen.hipMAGMA
  make generate

  cmake \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    .

  ninja -C build

}

package() {
  cd ${_dir}
  DESTDIR="${pkgdir}" ninja -Cbuild install

  install -d "${pkgdir}"/usr/share/magma/example
  cp -r "${srcdir}"/magma-${pkgver}/example/* "${pkgdir}"/usr/share/magma/example/
  install -d "${pkgdir}"/usr/share/magma/testing
  cp -r "${srcdir}"/magma-${pkgver}/testing/* "${pkgdir}"/usr/share/magma/testing/
  install -Dm644 "${srcdir}"/magma-${pkgver}/COPYRIGHT "${pkgdir}"/usr/share/licenses/magma/LICENSE
}

# vim:set ts=2 sw=2 et:
