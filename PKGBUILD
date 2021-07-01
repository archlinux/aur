# Maintainer: Kyle Brooks <brookskd@gmail.com>
# Submaintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2164

pkgname=openmvg-git
_gitname='openMVG'
_fragment="#branch=develop"
pkgver=1.6.r19.g5e98d504
pkgrel=1
pkgdesc='open Multiple View Geometry library. Basis for 3D computer vision and Structure from Motion.'
arch=('i686' 'x86_64')
url='http://imagine.enpc.fr/~moulonp/openMVG/'
license=('MPL')
options=('!emptydirs')
depends=('glfw' 'lz4' 'libpng' 'libjpeg' 'libtiff' 'libxcursor' 'libxinerama' 'libxrandr' 'libxxf86vm' 'libxi' 'graphviz' 'libgl' 'ceres-solver' 'gflags' 'flann' 'coin-or-coinutils' 'coin-or-clp' 'coin-or-osi' 'coin-or-lemon')
makedepends=('git' 'cmake' 'doxygen' 'eigen')
source=("git+https://github.com/${_gitname}/${_gitname}.git${_fragment}"
        'git+https://github.com/elmindreda/glfw.git'
        'git+https://github.com/openMVG-thirdparty/osi_clp.git'
        'git+https://github.com/openMVG-thirdparty/cereal.git'
        'findflann-v0.1.patch'
        'ld_ceres.patch::https://github.com/openMVG/openMVG/pull/1831.patch'
       )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '13b1f0195b5e97c17eec737e63f4da69c501bb4ced28c4c14517440009139043'
            '53e5211b55af6f1feabff8962c174227a68e7129f97c4624c05fe1cbca428f43')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'f70e6c4d3368d170d8c182511e1b2ee9aa76ff6495fee6f50fcfbcc432f2c330d4c84868a536df605e0c630b81d024ac0bdd48124d7ad1c4f8ff9114a1850854'
        '1ce09655750be003ea029be943e8382b0ca9512263bddd28b3536a73e18e071ea4d12de250a75c412649f129b58edbdc6c17302b760173cf338c194ad4b78251')

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
  git apply ${srcdir}/{findflann-v0.1,ld_ceres}.patch
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
