# Maintainer: Kyle Brooks <brookskd@gmail.com>
# Submaintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2164

pkgname=openmvg-git
_gitname='openMVG'
_fragment="#branch=develop"
pkgver=2.0.r43.gfe8283c8
pkgrel=1
pkgdesc='open Multiple View Geometry library. Basis for 3D computer vision and Structure from Motion.'
arch=('i686' 'x86_64')
url='http://imagine.enpc.fr/~moulonp/openMVG/'
license=('MPL')
options=('!emptydirs')
depends=(qt5-{base,svg} 'cereal' 'glfw' 'lz4' 'libpng' 'libjpeg' 'libtiff' 'libxcursor' 'libxinerama' 'libxrandr' 'libxxf86vm' 'libxi' 'graphviz' 'libgl' 'ceres-solver' 'gflags' 'flann' 'coin-or-coinutils' 'coin-or-clp' 'coin-or-osi' 'coin-or-lemon')
makedepends=('git' 'cmake' 'doxygen' 'eigen')
source=("git+https://github.com/${_gitname}/${_gitname}.git${_fragment}"
        'git+https://github.com/elmindreda/glfw.git'
        'findflann-v0.1.patch'
        'submodule.patch'
        'cereal_131.patch'
       )
sha256sums=('SKIP'
            'SKIP'
            '13b1f0195b5e97c17eec737e63f4da69c501bb4ced28c4c14517440009139043'
            '5dcde15464d0b457f0149fff2088f33e59f9c43a2aba9d2351538a0a5fce739d'
            'db8b6f2b6b75c33d3559ff7fb0c4e2471c12790ac5443342ba3c940906eed439')
b2sums=('SKIP'
        'SKIP'
        'f70e6c4d3368d170d8c182511e1b2ee9aa76ff6495fee6f50fcfbcc432f2c330d4c84868a536df605e0c630b81d024ac0bdd48124d7ad1c4f8ff9114a1850854'
        '688cd6f2ce02448bd75001c509b68f9265496abf0c6b00a46c373e3a6c337f5e24d4d6d3ce8cec3801fd823a076f1de68733edb0ae0283920aea16889c4299e1'
        'cd94990e9ef8d978df9c7275fa39c469043fa8b818ff9ed55425c01ccbb50a37feb54c3df09803f15fc86d1cdea2bd0559de467e9c9dc73fbff7b8b86f68f2f4')

pkgver() {
  git -C "${srcdir}/${_gitname}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  git config 'submodule.src/dependencies/glfw.url' "${srcdir}/glfw"
  git -c protocol.file.allow=always submodule update --init --remote src/dependencies/glfw
  git apply "${srcdir}"/{findflann-v0.1,submodule,cereal_131}.patch
}

build() {
  cmake -S "${srcdir}/${_gitname}"/src -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DOpenMVG_BUILD_SHARED=ON \
        -DOpenMVG_BUILD_EXAMPLES=ON \
         -DOpenMVG_BUILD_OPENGL_EXAMPLES=ON \
        -DOpenMVG_USE_OPENMP=ON \
        -DCOINUTILS_INCLUDE_DIR_HINTS=/usr/include/coin \
        -DCLP_INCLUDE_DIR_HINTS=/usr/include/coin \
        -DOSI_INCLUDE_DIR_HINTS=/usr/include/coin \
        -DLEMON_INCLUDE_DIR_HINTS=/usr/include/lemon \
        -DCERES_DIR_HINTS=/usr/include/ceres \
        -DEIGEN_INCLUDE_DIR_HINTS=/usr/include/eigen3 \
        -DFLANN_INCLUDE_DIR_HINTS=/usr/include/flann
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
