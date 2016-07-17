# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: aldelaro5 <aldelaro5@gmail.com>

_pkgbase='decaf-emu'
pkgname="$_pkgbase-git"
pkgver=r2210.2d91f54
pkgrel=1
pkgdesc="An experimental open-source Nintendo Wii U emulator"
arch=('x86_64')
url="https://github.com/decaf-emu/decaf-emu"
license=('GPL')
depends=('zlib' 'sdl2')
makedepends=('git' 'cmake')
source=("$_pkgbase::git+https://github.com/decaf-emu/decaf-emu"
        'git+https://github.com/zeux/pugixml'
        'git+https://github.com/kobalicek/asmjit'
        'git+https://github.com/gabime/spdlog'
        'git+https://github.com/USCiLab/cereal'
        'git+https://github.com/exjam/ovsocket'
        'git+https://github.com/cginternals/glbinding'
        'git+https://github.com/decaf-emu/gsl-lite'
        'git+https://github.com/decaf-emu/addrlib'
        'git+https://github.com/exjam/excmd'
        'git+https://github.com/ocornut/imgui')
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
         'SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  mkdir -p build

  git submodule init
  git config submodule.libraries/pugixml.url "$srcdir/pugixml"
  git config submodule.libraries/asmjit.url "$srcdir/asmjit"
  git config submodule.libraries/spdlog.url "$srcdir/spdlog"
  git config submodule.libraries/cereal.url "$srcdir/cereal"
  git config submodule.libraries/ovsocket.url "$srcdir/ovsocket"
  git config submodule.libraries/glbinding.url "$srcdir/glbinding"
  git config submodule.libraries/gsl-lite.url "$srcdir/gsl-lite"
  git config submodule.libraries/addrlib.url "$srcdir/addrlib"
  git config submodule.libraries/excmd.url "$srcdir/excmd"
  git config submodule.libraries/imgui.url "$srcdir/imgui"
}

build() {
  cd "$srcdir/$_pkgbase"
  git submodule update \
    libraries/pugixml \
    libraries/asmjit \
    libraries/spdlog \
    libraries/cereal \
    libraries/ovsocket \
    libraries/glbinding \
    libraries/gsl-lite \
    libraries/addrlib \
    libraries/excmd \
    libraries/imgui

  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_pkgbase/build"
  make DESTDIR="$pkgdir/" install
}
