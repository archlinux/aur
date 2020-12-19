# Maintainer: Kyle Brooks <brookskd@gmail.com>
# Submaintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2164

pkgname=openmvg-git
_gitname='openMVG'
_fragment="#branch=develop"
pkgver=1.5.r56.gbe94d6af
pkgrel=1
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
        'findflann-v0.1.patch'
        'gcc92.patch'
       )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '13b1f0195b5e97c17eec737e63f4da69c501bb4ced28c4c14517440009139043'
            '212589acc8a657b1096d15da9a96518b91181d9f53a1c5a7735846e964629c8c')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  git config 'submodule.src/dependencies/glfw.url' "${srcdir}/glfw"
  git config 'submodule.src/dependencies/osi_clp.url' "${srcdir}/osi_clp"
  git config 'submodule.src/dependencies/cereal.url' "${srcdir}/cereal"
  git submodule update --init --remote
  git apply ${srcdir}/{findflann-v0.1,gcc92}.patch
}

build() {
  cd "${srcdir}"
  mkdir -p openmvg_build
  cd openmvg_build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE -DOpenMVG_BUILD_SHARED=ON -DOpenMVG_BUILD_EXAMPLES=ON  -DOpenMVG_BUILD_OPENGL_EXAMPLES=ON -DOpenMVG_USE_OPENMP=ON -DCOINUTILS_INCLUDE_DIR_HINTS=/usr/include/coin -DCLP_INCLUDE_DIR_HINTS=/usr/include/coin -DOSI_INCLUDE_DIR_HINTS=/usr/include/coin -DLEMON_INCLUDE_DIR_HINTS=/usr/include/lemon -DCERES_DIR_HINTS=/usr/include/ceres -DEIGEN_INCLUDE_DIR_HINTS=/usr/include/eigen3 -DFLANN_INCLUDE_DIR_HINTS=/usr/include/flann ../openMVG/src/
  make
}

package() {
  cd "${srcdir}/openmvg_build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
