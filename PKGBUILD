# Maintainer: Kyle Brooks <brookskd@gmail.com>
# update: bartus <aur\at/bartus.33mail.com>
pkgname=openmvg-git
_gitname='openMVG'
_fragment="#branch=develop"
pkgver=1.3.r55.g01cb080b
pkgrel=5
pkgdesc='open Multiple View Geometry library. Basis for 3D computer vision and Structure from Motion.'
arch=('i686' 'x86_64')
url='http://imagine.enpc.fr/~moulonp/openMVG/'
license=('MPL')
depends=('lz4' 'libpng' 'libjpeg' 'libtiff' 'libxrandr' 'libxxf86vm' 'libxi' 'graphviz' 'libgl' 'ceres-solver' 'gflags' 'flann' 'coin-or-coinutils' 'coin-or-clp' 'coin-or-osi' 'coin-or-lemon')
makedepends=('git' 'cmake' 'doxygen' 'eigen')
source=("git+https://github.com/${_gitname}/${_gitname}.git${_fragment}"
        'git+https://github.com/elmindreda/glfw.git'
        'git+https://github.com/openMVG-thirdparty/osi_clp.git'
        'git+https://github.com/openMVG-thirdparty/cereal.git'
        'fast.patch'
        'lemon.patch'
        'flann.patch'
       )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'c2fff3b04a2444a635eab1709be6b4f2'
         '11aa728e50e52b10d79dd83dfaa6c1c6'
         '91e8cb2e3b2449de83dd49c83359b8ab')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  git submodule init
  git config 'submodule.src/dependencies/glfw.url' "${srcdir}/glfw"
  git config 'submodule.src/dependencies/osi_clp.url' "${srcdir}/osi_clp"
  git config 'submodule.src/dependencies/cereal.url' "${srcdir}/cereal"
  git submodule update
  git apply ${srcdir}/lemon.patch
  git apply ${srcdir}/fast.patch
  git apply ${srcdir}/flann.patch
  cp src/third_party/flann/cmake/FindFlann.cmake src/cmakeFindModules/
}

build() {
  cd "${srcdir}"
  mkdir -p openmvg_build
  cd openmvg_build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE -DOpenMVG_BUILD_SHARED=ON -DOpenMVG_BUILD_EXAMPLES=ON  -DOpenMVG_BUILD_OPENGL_EXAMPLES=ON -DOpenMVG_USE_OPENMP=ON -DFLANN_INCLUDE_DIR_HINTS=/usr/include -DCOINUTILS_INCLUDE_DIR_HINTS=/usr/include/coin -DCLP_INCLUDE_DIR_HINTS=/usr/include/coin -DOSI_INCLUDE_DIR_HINTS=/usr/include/coin -DLEMON_INCLUDE_DIR_HINTS=/usr/include/lemon -DCERES_DIR_HINTS=/usr/include/ceres -DEIGEN_INCLUDE_DIR_HINTS=/usr/include/eigen3 ../openMVG/src/
  make
}

package() {
  cd "${srcdir}/openmvg_build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
