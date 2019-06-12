# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-citra-git
pkgver=r6961.37192ff3
pkgrel=1
pkgdesc='Nintendo 3DS core'
arch=('x86_64')
url='https://github.com/libretro/citra'
license=('GPL2')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('cmake' 'git')
provides=('libretro-citra')
conflicts=('libretro-citra')
source=('libretro-citra::git+https://github.com/libretro/citra.git'
        'citra-boost::git+https://github.com/citra-emu/ext-boost.git'
        'git+https://github.com/philsquared/Catch.git'
        'git+https://github.com/zeromq/cppzmq.git'
        'git+https://github.com/weidai11/cryptopp.git'
        'git+https://github.com/kinetiknz/cubeb.git'
        'git+https://github.com/discordapp/discord-rpc.git'
        'git+https://github.com/MerryMage/dynarmic.git'
        'git+https://github.com/lsalzman/enet.git'
        'git+https://github.com/fmtlib/fmt.git'
        'git+https://github.com/svn2github/inih.git'
        'citra-libressl::git+https://github.com/citra-emu/ext-libressl-portable.git'
        'git+https://github.com/zeromq/libzmq.git'
        'git+https://github.com/neobrain/nihstro.git'
        'git+https://github.com/arsenm/sanitizers-cmake.git'
        'citra-soundtouch::git+https://github.com/citra-emu/ext-soundtouch.git'
        'git+https://github.com/herumi/xbyak.git')
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

  for submodule in externals/{catch,cppzmq,cryptopp/cryptopp,cubeb,discord-rpc,dynarmic,enet,fmt,inih/inih,libressl,libzmq,nihstro,xbyak}; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule##*/}
    git submodule update
  done
  for submodule in externals/{boost,soundtouch}; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../citra-${submodule##*/}
    git submodule update
  done

  cd externals/cubeb

  for submodule in cmake/sanitizers-cmake; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../../../${submodule##*/}
    git submodule update
  done
}

build() {
  cd libretro-citra/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DENABLE_LIBRETRO='ON' \
    -DENABLE_QT='OFF' \
    -DENABLE_SDL2='OFF' \
    -DENABLE_WEB_SERVICE='OFF'
  make
}

package() {
  cd libretro-citra/build

  install -Dm 644 src/citra_libretro/citra_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
