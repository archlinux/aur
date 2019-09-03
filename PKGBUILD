#!/hint/bash
# shellcheck disable=SC2034
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: pingplug <pingplug@foxmail.com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

##### Configuration Options
# Specify GPU compute capability Fermi (2.x) or Kepler (3.x) or Maxwell (5.x)
#_GPU_TARGET=Fermi
#_GPU_TARGET=Kepler
#_GPU_TARGET=Maxwell
#_GPU_TARGET=Pascal
#_GPU_TARGET=Volta
# Can also be one of these: sm_20 sm_30 sm_50 sm_60 sm_70 etc.
#_GPU_TARGET=sm_30
##### End

pkgname=(magma magma-libs)
pkgver=2.5.1
((TRAVIS)) && pkgver=2.5.0 # downgrade to prevernt time out.
pkgrel=2
pkgdesc="Provides a dense linear algebra library similar to LAPACK but for heterogeneous/hybrid architectures, starting with current 'Multicore+GPU' systems (with CUDA)"
arch=('x86_64')
url="https://icl.cs.utk.edu/magma/"
license=('custom')
makedepends=('gcc-fortran' 'cmake' 'blas' 'lapack' 'cuda')
options=('staticlibs')
source=("http://icl.cs.utk.edu/projectsfiles/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ce32c199131515336b30c92a907effe0c441ebc5c5bdb255e4b06b2508de109f')
((TRAVIS)) && sha256sums=('4fd45c7e46bd9d9124253e7838bbfb9e6003c64c2c67ffcff02e6c36d2bcfa33')

_CMAKE_FLAGS=( -DCMAKE_BUILD_TYPE=Release
               -DCMAKE_INSTALL_PREFIX=/usr )

[ -n "${_GPU_TARGET}" ]                   && _CMAKE_FLAGS+=(-DGPU_TARGET=${_GPU_TARGET})
[ -f "/usr/lib/ccache/bin/nvcc-ccache" ]  && _CMAKE_FLAGS+=( -DCUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache )

if _cuda_gcc=$(basename $(readlink /opt/cuda/bin/gcc)) ; then
  [ -L "/usr/lib/ccache/bin/$_cuda_gcc" ] && _CMAKE_FLAGS+=( -DCUDA_HOST_COMPILER=/usr/lib/ccache/bin/$_cuda_gcc )
fi

build() {
  cd "${srcdir}/magma-${pkgver}"

    msg2 "Build shared ${pkgname} library"
    mkdir -p build-shared && pushd build-shared
    cmake ${_CMAKE_FLAGS[@]} -DBUILD_SHARED_LIBS:BOOL=ON ..
    make magma magma_sparse
    popd

    msg2 "Build static ${pkgname} library"
    mkdir -p build-static && pushd build-static
    cmake ${_CMAKE_FLAGS[@]} -DBUILD_SHARED_LIBS:BOOL=OFF ..
    make magma magma_sparse
    popd
}

package_magma() {
  pkgdesc+=" [static libraries and headers]"
  depends=(magma-libs)
  optdepends=('python2: for examples and tests')
  cd ${srcdir}/magma-${pkgver}/build-static # "$dir"
  # do not build test
  sed -i "s/install: preinstall/install: magma_sparse/g" Makefile
  make DESTDIR="${pkgdir}" install

  mkdir -p ${pkgdir}/usr/share/magma/example
  cp -ru ${srcdir}/magma-${pkgver}/example/* ${pkgdir}/usr/share/magma/example/
  mkdir -p ${pkgdir}/usr/share/magma/testing
  cp -ru ${srcdir}/magma-${pkgver}/testing/* ${pkgdir}/usr/share/magma/testing/
  mkdir -p ${pkgdir}/usr/share/licenses/magma
  cp ${srcdir}/magma-${pkgver}/COPYRIGHT ${pkgdir}/usr/share/licenses/magma/LICENSE
}

package_magma-libs() {
  depends=('blas' 'lapack' 'cuda')
  cd ${srcdir}/magma-${pkgver}/build-shared # "$dir"
  # do not build test
  sed -i "s/install: preinstall/install: magma_sparse/g" Makefile
  make DESTDIR="${pkgdir}" install

  rm -rf ${pkgdir}/usr/{include,lib/pkgconfig}
  mkdir -p ${pkgdir}/usr/share/licenses/magma-libs
  cp ${srcdir}/magma-${pkgver}/COPYRIGHT ${pkgdir}/usr/share/licenses/magma-libs/LICENSE
}

# vim:set ts=2 sw=2 et:
