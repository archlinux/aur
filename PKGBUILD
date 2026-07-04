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
pkgver=1.20.4
pkgrel=4
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
  sdl2
  sdl2_ttf
  snappy
  zlib
)
source=(
  git+https://github.com/hrydgard/ppsspp.git#tag=v${pkgver}
  git+https://github.com/Kethen/aemu_postoffice.git
  git+https://github.com/Kingcom/armips.git
  git+https://github.com/google/cpu_features.git
  git+https://github.com/discordapp/discord-rpc.git
  git+https://github.com/hrydgard/ppsspp-ffmpeg.git
  armips-filesystem::git+https://github.com/Kingcom/filesystem.git
  ppsspp-freetype::git+https://github.com/hrydgard/freetype.git
  ppsspp-glslang::git+https://github.com/hrydgard/glslang.git
  git+https://github.com/hrydgard/ppsspp-lang.git
  git+https://github.com/rtissera/libchdr.git
  git+https://github.com/hrydgard/ppsspp-lua.git
  git+https://github.com/miniupnp/miniupnp.git
  git+https://github.com/hrydgard/nanosvg.git
  git+https://github.com/KhronosGroup/OpenXR-SDK.git
  git+https://github.com/Tencent/rapidjson.git
  git+https://github.com/RetroAchievements/rcheevos.git
  git+https://github.com/KhronosGroup/SPIRV-Cross.git
)
b2sums=('cd2bca3351b97831f2e0d372bf544dcf3aa9d44095b56fe30de8bf4d586216e56ba24f22f3fac51ffb1343d4763fe3466628d6730c502c5e2230315b6319c336'
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
        'SKIP'
        'SKIP')

prepare() {
  cd ppsspp
  sed 's|miniupnpc/include/|miniupnpc/|g' -i Core/Util/PortManager.h

  # Add Comment field to desktop entry
  # https://github.com/hrydgard/ppsspp/pull/21880
  git cherry-pick -n 0f48685bb9158e5d6cafa0158441d7adba2471c7

  for submodule in ffmpeg assets/lang ext/freetype ext/glslang ext/lua; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../ppsspp-${submodule#*/}
    git -c protocol.file.allow=always submodule update ${submodule}
  done
  for submodule in ext/{aemu_postoffice,armips,cpu_features,discord-rpc,libchdr,miniupnp,nanosvg,OpenXR-SDK,rapidjson,rcheevos,SPIRV-Cross}; do
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
  cmake -S ppsspp -B build -G Ninja \
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
  cmake --build build
}

package_ppsspp() {
  depends=(
    glew
    glibc
    hicolor-icon-theme
    libgcc
    libgl
    libpng
    libstdc++
    libzip
    miniupnpc
    openxr
    ppsspp-assets
    sdl2
    sdl2_ttf
    snappy
    zlib
    zstd
  )
  install -Dm 755 build/PPSSPPSDL -t "${pkgdir}"/usr/bin/
  install -Dm 755 build/PPSSPPHeadless -t "${pkgdir}"/usr/bin/
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve=ownership ppsspp/icons/hicolor "${pkgdir}"/usr/share/icons/
  install -Dm 644 ppsspp/icons/icon-512.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/ppsspp.svg
  install -Dm 644 ppsspp/SDL/PPSSPPSDL.desktop -t "${pkgdir}"/usr/share/applications/
}

package_ppsspp-assets() {
  install -dm 755 "${pkgdir}"/usr/share/ppsspp
  cp -dr --no-preserve=ownership build/assets "${pkgdir}"/usr/share/ppsspp/
}
