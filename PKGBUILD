# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ben Reedy <thebenj88@gmail.com>
# Contributor: Clement Guerin <geecko.dev@free.fr>
# Contributor: Thiago Kenji Okada <thiago.mast3r@gmail.com>

pkgname=ppsspp
pkgver=1.9.4
pkgrel=5
pkgdesc='A PSP emulator written in C++'
arch=(x86_64)
url=https://www.ppsspp.org/
license=(GPL2)
depends=(
  gcc-libs
  glew
  glibc
  hicolor-icon-theme
  libgl
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
  git+https://github.com/hrydgard/ppsspp-ffmpeg.git
  ppsspp-glslang::git+https://github.com/hrydgard/glslang.git
  git+https://github.com/hrydgard/ppsspp-lang.git
  git+https://github.com/Tencent/rapidjson.git
  git+https://github.com/KhronosGroup/SPIRV-Cross.git
  armips-tinyformat::git+https://github.com/Kingcom/tinyformat.git
  ppsspp-sdl.desktop
  ppsspp-qt.desktop
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
            'SKIP'
            '47977bbdc36cd9eebe74b204e69aa8c0eb39b1ec66d89e7b90b1c216e5778d8d'
            '7df9274e8f404a8009042a529729ca43332c264cff032f32b2ce1bf5adf04042'
            '6694643d96dae673f01555637139468eb277f3379afbcceccad3f7e0ae670278')

pkgver() {
  cd ppsspp

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd ppsspp

  patch -Np1 -i ../ppsspp-flags.patch

  for submodule in assets/lang ext/glslang ffmpeg; do
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
  cmake -S ppsspp -B build-sdl \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DHEADLESS=ON \
    -DUSE_SYSTEM_LIBZIP=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DUSE_SYSTEM_SNAPPY=ON \
    -DUSING_QT_UI=OFF
  make -C build-sdl
  cmake -S ppsspp -B build-qt \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DHEADLESS=OFF \
    -DUSE_SYSTEM_LIBZIP=ON \
    -DUSE_SYSTEM_SNAPPY=ON \
    -DUSING_QT_UI=ON
  make -C build-qt
}

package() {
  install -Dm 755 build-sdl/PPSSPPSDL -t "${pkgdir}"/usr/bin/
  install -Dm 755 build-sdl/PPSSPPHeadless -t "${pkgdir}"/usr/bin/
  install -Dm 755 build-qt/PPSSPPQt -t "${pkgdir}"/usr/bin/
  install -dm 755 "${pkgdir}"/usr/share/{icons,ppsspp}
  cp -dr --no-preserve=ownership build-sdl/assets "${pkgdir}"/usr/share/ppsspp/
  cp -dr --no-preserve=ownership ppsspp/icons/hicolor "${pkgdir}"/usr/share/icons/
  install -Dm 644 ppsspp/icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -Dm 644 ppsspp-sdl.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 ppsspp-qt.desktop -t "${pkgdir}"/usr/share/applications/
}

# vim: ts=2 sw=2 et:
