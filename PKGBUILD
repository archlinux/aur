# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgbase='decaf-emu'
pkgname="$_pkgbase-git"
pkgver=r1058.0383843
pkgrel=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
arch=('i686' 'x86_64')
url="https://github.com/decaf-emu/decaf-emu"
license=('GPL')
depends=('zlib' 'glfw')
makedepends=('git' 'cmake')
source=("$_pkgbase::git+https://github.com/decaf-emu/decaf-emu"
        'git+https://github.com/kobalicek/asmjit'
        'git+https://github.com/USCiLab/cereal'
        'git+https://github.com/docopt/docopt.cpp'
        'git+https://github.com/exjam/ovsocket'
        'git+https://github.com/zeux/pugixml'
        'git+https://github.com/exjam/spdlog'
        'git+https://github.com/cginternals/glbinding'
        'git+https://github.com/decaf-emu/gsl-lite')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  mkdir -p build

  git submodule init
  git config submodule.libraries/asmjit.url "$srcdir/asmjit"
  git config submodule.libraries/cereal.url "$srcdir/cereal"
  git config submodule.libraries/docopt.url "$srcdir/docopt.cpp"
  git config submodule.libraries/ovsocket.url "$srcdir/ovsocket"
  git config submodule.libraries/pugixml.url "$srcdir/pugixml"
  git config submodule.libraries/spdlog.url "$srcdir/spdlog"
  git config submodule.libraries/glbinding.url "$srcdir/glbinding"
  git config submodule.libraries/gsl-lite.url "$srcdir/gsl-lite"
}

build() {
  cd "$srcdir/$_pkgbase"
  git submodule update \
    libraries/asmjit \
    libraries/cereal \
    libraries/docopt \
    libraries/ovsocket \
    libraries/pugixml \
    libraries/spdlog \
    libraries/glbinding \
    libraries/gsl-lite

  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_pkgbase/build"
  make DESTDIR="$pkgdir/" install
}
