# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ben Reedy <thebenj88@gmail.com>
# Contributor: Clement Guerin <geecko.dev@free.fr>
# Contributor: Thiago Kenji Okada <thiago.mast3r@gmail.com>

pkgbase=ppsspp
pkgname=(
  ppsspp
  ppsspp-assets
)
pkgver=1.19.3
pkgrel=3
pkgdesc='A PSP emulator written in C++'
arch=(x86_64)
url=https://www.ppsspp.org/
license=(GPL-2.0-or-later)
makedepends=(
  clang
  cmake
  git
  glew
  glu
  libglvnd
  libpng
  libzip
  miniupnpc
  ninja
  openxr
  python
  qt5-base
  qt5-multimedia
  qt5-tools
  sdl2
  sdl2_ttf
  snappy
  zlib
)
_tag=a0cd10949c4c3738c47adce9f673700c13f08645
source=(
  git+https://github.com/hrydgard/ppsspp.git#tag=${_tag}
  git+https://github.com/Kingcom/armips.git
  git+https://github.com/google/cpu_features.git
  git+https://github.com/discordapp/discord-rpc.git
  git+https://github.com/hrydgard/ppsspp-ffmpeg.git
  armips-filesystem::git+https://github.com/Kingcom/filesystem.git
  ppsspp-glslang::git+https://github.com/hrydgard/glslang.git
  git+https://github.com/hrydgard/ppsspp-lang.git
  git+https://github.com/rtissera/libchdr.git
  git+https://github.com/hrydgard/ppsspp-lua.git
  git+https://github.com/miniupnp/miniupnp.git
  git+https://github.com/KhronosGroup/OpenXR-SDK.git
  git+https://github.com/Tencent/rapidjson.git
  git+https://github.com/RetroAchievements/rcheevos.git
  git+https://github.com/KhronosGroup/SPIRV-Cross.git
  PPSSPPSDL.desktop
  PPSSPPQt.desktop
)
b2sums=('8154539137174d017efc2e17f7ecba5e8c7c350dfc909379b8928037e6f71820854580b6c7a6e6ff576ba34fc4d3a050fbf9df3244e16150bf4e2f80802fc7d6'
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
        'c6bcdfedee866dfdcc82a8c333c31ff73ed0beec65b63acec8bc8186383c0bc9f0912f21bb9715b665e8dc1793b1a85599761f9037856fa54ad8aa3bfdbfd468'
        '328e2ba47b78d242b0ec6ba6bfa039c77a36d1ef7246e5c2c2432d8e976e9360baf505eb05f48408ede1a30545cbbb7f875bf5ebd0252cef35523d449b8254a0')

pkgver() {
  cd ppsspp
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd ppsspp
  sed 's|miniupnpc/include/|miniupnpc/|g' -i Core/Util/PortManager.h
  for submodule in ffmpeg assets/lang ext/glslang ext/lua; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../ppsspp-${submodule#*/}
    git -c protocol.file.allow=always submodule update ${submodule}
  done
  for submodule in ext/{armips,cpu_features,discord-rpc,libchdr,miniupnp,OpenXR-SDK,rapidjson,rcheevos,SPIRV-Cross}; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule#*/}
    git -c protocol.file.allow=always submodule update ${submodule}
  done
  cd ext/armips
  for submodule in ext/filesystem; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../../../armips-${submodule#*/}
    git -c protocol.file.allow=always submodule update ${submodule}
  done
}

build() {
  export CC=clang
  export CXX=clang++
  cmake -S ppsspp -B build-sdl -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DHEADLESS=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DUSE_SYSTEM_LIBZIP=ON \
    -DUSE_SYSTEM_MINIUPNPC=ON \
    -DUSE_SYSTEM_SNAPPY=ON \
    -DUSE_SYSTEM_ZSTD=ON \
    -DUSING_QT_UI=OFF \
    -Wno-dev
  cmake --build build-sdl
  cmake -S ppsspp -B build-qt -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DHEADLESS=OFF \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DUSE_SYSTEM_LIBZIP=ON \
    -DUSE_SYSTEM_MINIUPNPC=ON \
    -DUSE_SYSTEM_SNAPPY=ON \
    -DUSE_SYSTEM_ZSTD=ON \
    -DUSING_QT_UI=ON \
    -Wno-dev
  cmake --build build-qt
}

package_ppsspp() {
  depends=(
    fontconfig
    gcc-libs
    glew
    glibc
    hicolor-icon-theme
    libgl
    libpng
    libzip
    miniupnpc
    openxr
    ppsspp-assets
    qt5-base
    qt5-multimedia
    sdl2
    sdl2_ttf
    snappy
    zlib
    zstd
  )
  install -Dm 755 build-sdl/PPSSPPSDL -t "${pkgdir}"/usr/bin/
  install -Dm 755 build-sdl/PPSSPPHeadless -t "${pkgdir}"/usr/bin/
  install -Dm 755 build-qt/PPSSPPQt -t "${pkgdir}"/usr/bin/
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve=ownership ppsspp/icons/hicolor "${pkgdir}"/usr/share/icons/
  install -Dm 644 ppsspp/icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -Dm 644 PPSSPPSDL.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 PPSSPPQt.desktop -t "${pkgdir}"/usr/share/applications/
}

package_ppsspp-assets() {
  install -dm 755 "${pkgdir}"/usr/share/ppsspp
  cp -dr --no-preserve=ownership build-sdl/assets "${pkgdir}"/usr/share/ppsspp/
}

# vim: ts=2 sw=2 et:
