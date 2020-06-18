#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# -> disable check() until #63 is fixed
DISABLE_CHECK=1

_name=popsift
pkgname=(${_name} ${_name}-libs)
pkgver=1.0.0
pkgrel=2
pkgdesc="Realtime GPU implementation of SIFT, 25 fps on HD images on recent graphic cards. (DOI: 10.1145/3204949.3208136)"
arch=('i686' 'x86_64')
url="https://alicevision.github.io/"
license=('MPL2')
groups=()
conflicts=()
provides=()
makedepends=('boost' 'cmake' 'git')
makedepends+=('cuda>=7.0')
checkdepends=('wget')
source=("${_name}::git+https://github.com/alicevision/popsift.git")
sha256sums=('SKIP')

_CMAKE_FLAGS=( -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release )
((DISABLE_CHECK)) && _CMAKE_FLAGS+=( -DPopSift_BUILD_EXAMPLES=OFF ) || _CMAKE_FLAGS+=( -DPopSift_BUILD_EXAMPLES=ON -DPopSift_USE_TEST_CMD=ON )

build() {
  cd ${srcdir}

  msg2 "Build static ${_name} library"
    mkdir -p build_static && pushd build_static
    cmake ${_CMAKE_FLAGS[*]} -DBUILD_SHARED_LIBS=OFF -DCUDA_USE_STATIC_CUDA_RUNTIME=ON ${srcdir}/${_name}
    make
    popd

  msg2 "Build static ${_name} library"
    mkdir -p build_shared && pushd build_shared
    cmake ${_CMAKE_FLAGS[*]} -DBUILD_SHARED_LIBS=ON ${srcdir}/${_name}
    make
    popd
}


package_popsift() {
  pkgdesc+=" [development headers and static libs]"
  depends=('boost')
  optdepend=('cuda: for static cudart library')
  options=('staticlibs')
  cd ${srcdir}/build_static
  make DESTDIR=${pkgdir} install
}

package_popsift-libs() {
  depends=('boost-libs>=1.55' 'libcudart.so')
  cd ${srcdir}/build_shared
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/{include,shared}
}

check() {
  cd ${srcdir}/build_static
  if ! ((DISABLE_CHECK)); then
    make prepare-test
    make run-test-boat
#   make run-test
  fi
}
# vim:set ts=2 sw=2 et:
