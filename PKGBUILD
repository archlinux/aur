# Maintainer: Jiuyang Liu <jiuyang.liu@sifive.com>

pkgname=openroad-git
pkgver=1
pkgrel=1
pkgdesc='A framework for RTL synthesis'
arch=('x86_64')
url='https://theopenroadproject.org/'
license=('BSD')
depends=('bison' 'blas' 'flex' 'swig' 'boost' 'tcl' 'zlib')
makedepends=('cmake' 'clang' 'git')
source=(
  "git+https://github.com/The-OpenROAD-Project/OpenROAD.git"
  "git+https://github.com/The-OpenROAD-Project/OpenSTA.git"
  "git+https://github.com/The-OpenROAD-Project/OpenDB.git"
  "git+https://github.com/The-OpenROAD-Project/flute3.git"
  "git+https://github.com/The-OpenROAD-Project/RePlAce.git"
  "git+https://github.com/The-OpenROAD-Project/ioPlacer.git"
  "git+https://github.com/The-OpenROAD-Project/FastRoute.git"
  "git+https://gitlab.com/libeigen/eigen.git"
  "git+https://github.com/The-OpenROAD-Project/TritonMacroPlace.git"
  "git+https://github.com/The-OpenROAD-Project/OpenRCX.git"
  "git+https://github.com/The-OpenROAD-Project/PDNSim.git"
  "git+https://github.com/The-OpenROAD-Project/superlu.git"
  "git+https://github.com/The-OpenROAD-Project/lef.git"
  "git+https://github.com/The-OpenROAD-Project/def.git"
  )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd $srcdir/OpenROAD
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd $srcdir/OpenROAD
  git submodule init
  git config submodule.module/OpenSTA.url $srcdir/OpenSTA
  git config submodule.module/eigen.url $srcdir/OpenDB
  git config submodule.flute3.url $srcdir/flute3
  git config submodule.src/replace.url $srcdir/RePlAce
  git config submodule.src/ioPlacer.url $srcdir/ioPlacer
  git config submodule.src/FastRoute.url $srcdir/FastRoute
  git config submodule.src/eigen.url $srcdir/eigen
  git config submodule.src/TritonMacroPlace.url $srcdir/TritonMacroPlace
  git config submodule.src/OpenRCX.url $srcdir/OpenRCX
  git config submodule.src/PDNSim.url $srcdir/PDNSim
  git submodule update
  cd src/PDNSim
  git submodule init
  git config submodule.modules/superlu.url $srcdir/superlu
  git submodule update
  cd -
  cd src/OpenDB
  git submodule init
  git config submodule.src/lef.url $srcdir/lef
  git config submodule.src/def.url $srcdir/def
  git submodule update
  cd -
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
}

build() {
  cd $srcdir/OpenROAD/build
  make
}

package() {
  cd $srcdir/OpenROAD/build
  make install
}
