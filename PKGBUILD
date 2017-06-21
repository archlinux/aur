# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-citra-git
pkgver=r4851.ae8cfe69
pkgrel=1
pkgdesc='Nintendo 3DS core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/citra'
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'glibc')
makedepends=('boost' 'cmake' 'git')
provides=('libretro-citra')
conflicts=('libretro-citra')
source=('libretro-citra::git+https://github.com/libretro/citra.git'
        'git+https://github.com/philsquared/Catch#tag=v1.9.5'
        'git+https://github.com/weidai11/cryptopp'
        'git+https://github.com/MerryMage/dynarmic'
        'git+https://github.com/fmtlib/fmt#tag=3.0.2'
        'git+https://github.com/svn2github/inih'
        'git+https://github.com/neobrain/nihstro'
        'citra-soundtouch::git+https://github.com/citra-emu/ext-soundtouch'
        'git+https://github.com/herumi/xbyak#tag=v5.43'
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
            'a9404c4eb4fb8a4caca9efbbd764bd272381a7a6f4378a05e956e3efbe4ba79e')

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

  for submodule in externals/{catch,cryptopp/cryptopp,dynarmic,fmt,inih/inih,nihstro,soundtouch,xbyak}; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule##*/}
    git submodule update
  done
}

build() {
  cd libretro-citra/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_PREFIX='/usr' \
    -DDISABLE_LIBPNG='ON' \
    -DENABLE_LIBRETRO='ON' \
    -DENABLE_QT='OFF' \
    -DENABLE_SDL2='OFF'
  make
}

package() {
  cd libretro-citra/build

  install -Dm 644 src/citra_libretro/citra_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 ../../citra_libretro.info -t "${pkgdir}"/usr/share/libretro/info/
}

# vim: ts=2 sw=2 et:
