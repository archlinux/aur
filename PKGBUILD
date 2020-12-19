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
        'ld_ceres.patch::https://github.com/openMVG/openMVG/pull/1831.patch'
       )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '13b1f0195b5e97c17eec737e63f4da69c501bb4ced28c4c14517440009139043'
            '212589acc8a657b1096d15da9a96518b91181d9f53a1c5a7735846e964629c8c'
            '06697257b4c5484bc48cf8683b3984e5d26035113e84f5eabb8fb15ce46b2577')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'f70e6c4d3368d170d8c182511e1b2ee9aa76ff6495fee6f50fcfbcc432f2c330d4c84868a536df605e0c630b81d024ac0bdd48124d7ad1c4f8ff9114a1850854'
        'be317b1259e869fdb2aa89406871956289e1c0b2cc1bebe999a4a6a8ea37e86cbead941640bc150a529bf955b019e7c4b00197bf2afe50bb48ab7622a9dfb386'
        '27dcb7b842cb8bf775297bc5a7daf347c87509e146b0d1d2d142be90f5bd723a5aefb3412297aca5123b0712eae764b8bb742726f930d01e8378e25fdae8f8b4')

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
  git apply ${srcdir}/{findflann-v0.1,gcc92,ld_ceres}.patch
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
