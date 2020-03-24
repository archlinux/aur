# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ben Reedy <thebenj88@gmail.com>
# Contributor: Clement Guerin <geecko.dev@free.fr>
# Contributor: Thiago Kenji Okada <thiago.mast3r@gmail.com>

pkgname=ppsspp
pkgver=1.9.4
pkgrel=2
pkgdesc='A PSP emulator written in C++'
arch=(x86_64)
url=https://www.ppsspp.org/
license=(GPL2)
depends=(
  gcc-libs
  glew
  glibc
  hicolor-icon-theme
  libavcodec.so
  libavformat.so
  libavutil.so
  libgl
  libswresample.so
  libswscale.so
  libzip
  qt5-base
  sdl2
  snappy
  zlib
)
makedepends=(
  cmake
  git
  libglvnd
  python
  qt5-tools
)
provides=(
  ppsspp-headless
  ppsspp-qt
)
conflicts=(
  ppsspp-headless
  ppsspp-qt
)
replaces=(
  ppsspp-headless
  ppsspp-qt
)
source=(
  git+https://github.com/hrydgard/ppsspp.git#tag=e3c9793cb3a68ec9f44371c7ebb45a0abed1ecca
  git+https://github.com/Kingcom/armips.git
  git+https://github.com/discordapp/discord-rpc.git
  ppsspp-glslang::git+https://github.com/hrydgard/glslang.git
  git+https://github.com/hrydgard/ppsspp-lang.git
  git+https://github.com/Tencent/rapidjson.git
  git+https://github.com/KhronosGroup/SPIRV-Cross.git
  armips-tinyformat::git+https://github.com/Kingcom/tinyformat.git
  ppsspp.desktop
  ppsspp-flags.patch
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '93685b9f05322fa24753fc857bf63da7d6e0ee1bcb7e2167ba7600f38079e277'
            '6694643d96dae673f01555637139468eb277f3379afbcceccad3f7e0ae670278')

pkgver() {
  cd ppsspp

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd ppsspp

  patch -Np1 -i ../ppsspp-flags.patch

  for submodule in assets/lang ext/glslang; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../ppsspp-${submodule#*/}
    git submodule update ${submodule}
  done

  for submodule in ext/{armips,discord-rpc,rapidjson,SPIRV-Cross}; do
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
  cmake -S ppsspp -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DHEADLESS=ON \
    -DUSE_SYSTEM_FFMPEG=ON \
    -DUSE_SYSTEM_LIBZIP=ON \
    -DUSE_SYSTEM_SNAPPY=ON \
    -DUSING_QT_UI=ON
  make -C build
}

package() {
  install -Dm 755 build/PPSSPPHeadless -t "${pkgdir}"/usr/bin/
  install -Dm 755 build/PPSSPPQt -t "${pkgdir}"/usr/bin/
  install -dm 755 "${pkgdir}"/usr/share/{icons,ppsspp}
  cp -dr --no-preserve=ownership build/assets "${pkgdir}"/usr/share/ppsspp/
  cp -dr --no-preserve=ownership ppsspp/icons/hicolor "${pkgdir}"/usr/share/icons/
  install -Dm 644 ppsspp/icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -Dm 644 ppsspp.desktop -t "${pkgdir}"/usr/share/applications/
}

# vim: ts=2 sw=2 et:
