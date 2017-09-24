# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-citra-git
pkgver=r5167.c8921662
pkgrel=1
pkgdesc='Nintendo 3DS core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/citra'
license=('GPL2')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=('libretro-citra')
conflicts=('libretro-citra')
source=('libretro-citra::git+https://github.com/libretro/citra.git'
        'citra-boost::git+https://github.com/citra-emu/ext-boost'
        'git+https://github.com/philsquared/Catch#tag=v1.9.6'
        'git+https://github.com/whoshuu/cpr#tag=1.3.0'
        'git+https://github.com/weidai11/cryptopp'
        'git+https://github.com/MerryMage/dynarmic'
        'git+https://github.com/lsalzman/enet'
        'git+https://github.com/fmtlib/fmt#tag=4.0.0'
        'git+https://github.com/svn2github/inih'
        'git+https://github.com/neobrain/nihstro'
        'citra-soundtouch::git+https://github.com/citra-emu/ext-soundtouch'
        'git+https://github.com/herumi/xbyak#tag=v5.50'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/citra_libretro.info')
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
            'SKIP'
            '1fd275b44c1b8a46dce4b5fa1e00d65daf2b19a28079bb643e8f3f22b9997187')

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
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DDISABLE_LIBPNG='ON' \
    -DENABLE_LIBRETRO='ON' \
    -DENABLE_QT='OFF' \
    -DENABLE_SDL2='OFF' \
    -DUSE_SYSTEM_CURL='ON'
  make
}

package() {
  cd libretro-citra/build

  install -Dm 644 src/citra_libretro/citra_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 ../../citra_libretro.info -t "${pkgdir}"/usr/share/libretro/info/
}

# vim: ts=2 sw=2 et:
