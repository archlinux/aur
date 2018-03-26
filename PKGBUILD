# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-citra-git
pkgver=r5903.7f983fe7
pkgrel=1
pkgdesc='Nintendo 3DS core'
arch=('x86_64')
url='https://github.com/libretro/citra'
license=('GPL2')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc' 'libretro-core-info' 'sdl2'
         'libcurl.so')
makedepends=('cmake' 'git')
provides=('libretro-citra')
conflicts=('libretro-citra')
source=('libretro-citra::git+https://github.com/libretro/citra.git'
        'citra-boost::git+https://github.com/citra-emu/ext-boost'
        'git+https://github.com/philsquared/Catch'
        'git+https://github.com/whoshuu/cpr'
        'git+https://github.com/weidai11/cryptopp'
        'git+https://github.com/MerryMage/dynarmic'
        'git+https://github.com/lsalzman/enet'
        'git+https://github.com/fmtlib/fmt'
        'git+https://github.com/svn2github/inih'
        'git+https://github.com/neobrain/nihstro'
        'citra-soundtouch::git+https://github.com/citra-emu/ext-soundtouch'
        'git+https://github.com/herumi/xbyak')
sha256sums=('SKIP'
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
  cd libretro-citra

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd libretro-citra

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  for submodule in externals/{catch,cpr,cryptopp/cryptopp,dynarmic,enet,fmt,inih/inih,nihstro,xbyak}; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule##*/}
    git submodule update
  done
  for submodule in externals/{boost,soundtouch}; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../citra-${submodule##*/}
    git submodule update
  done
}

build() {
  cd libretro-citra/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DENABLE_LIBRETRO='ON' \
    -DENABLE_QT='OFF' \
    -DENABLE_SDL2='ON' \
    -DUSE_SYSTEM_CURL='ON'
  make
}

package() {
  cd libretro-citra/build

  install -Dm 644 src/citra_libretro/citra_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
