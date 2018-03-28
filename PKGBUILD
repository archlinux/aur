# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
# Contributor: Duck Hunt <vaporeon@tfwno.gf>

pkgname=libretro-ppsspp-git
pkgver=r24058.29de4b5a1
pkgrel=1
pkgdesc='Sony PlayStation Portable core'
arch=('x86_64')
url='https://github.com/libretro/libretro-ppsspp'
license=('GPL2')
groups=('libretro-unstable')
depends=('gcc-libs' 'glew' 'glibc' 'libgl' 'libretro-core-info' 'sdl2' 'zlib')
makedepends=('cmake' 'git' 'glu')
provides=('libretro-ppsspp')
conflicts=('libretro-ppsspp')
source=('libretro-ppsspp::git+https://github.com/libretro/ppsspp.git'
        'ppsspp-ffmpeg::git+https://github.com/hrydgard/ppsspp-ffmpeg.git'
        'ppsspp-glslang::git+https://github.com/hrydgard/glslang.git'
        'git+https://github.com/hrydgard/ppsspp-lang.git'
        'git+https://github.com/Kingcom/armips.git'
        'armips-tinyformat::git+https://github.com/Kingcom/tinyformat.git'
        'git+https://github.com/KhronosGroup/SPIRV-Cross.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd libretro-ppsspp

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  cd libretro-ppsspp

  for submodule in ffmpeg assets/lang ext/glslang; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../ppsspp-${submodule#*/}
    git submodule update ${submodule}
  done
  for submodule in ext/{SPIRV-Cross,armips}; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule#*/}
    git submodule update ${submodule}
  done

  cd ext/armips

  for submodule in ext/tinyformat; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../../../armips-${submodule#*/}
    git submodule update ${submodule}
  done
}

build() {
  cd build

  cmake ../libretro-ppsspp \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DHEADLESS='OFF' \
    -DLIBRETRO='ON' \
    -DUSING_QT_UI='OFF'
  make
}

package() {
  cd build

  install -Dm 644 lib/ppsspp_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 ../libretro-ppsspp/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/libretro-ppsspp-git/
}

# vim: ts=2 sw=2 et:
