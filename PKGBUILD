# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=yuzu
pkgver=1346
pkgrel=1
pkgdesc='Nintendo Switch emulator'
arch=(x86_64)
url=https://yuzu-emu.org/
license=(GPL3)
depends=(
  enet
  gcc-libs
  glibc
  libavcodec.so
  libavutil.so
  libboost_context.so
  libcrypto.so
  libfmt.so
  libINIReader.so
  libopus.so
  libspeexdsp.so
  libssl.so
  libswscale.so
  libusb-1.0.so
  libva.so
  libzstd.so
  lz4
  qt5-base
  qt5-multimedia
  qt5-webengine
  sdl2
)
makedepends=(
  boost
  clang
  cmake
  git
  glslang
  llvm
  ninja
  nlohmann-json
  qt5-tools
  shaderc
  spirv-headers
  vulkan-headers
)
options=(!debug)
_tag=647e73edcb4f190ec1edfd209a82d261862212ff
source=(
  git+https://github.com/yuzu-emu/yuzu-mainline.git#tag=${_tag}
  git+https://github.com/arsenm/sanitizers-cmake.git
  git+https://github.com/yhirose/cpp-httplib.git
  git+https://github.com/arun11299/cpp-jwt.git
  git+https://github.com/mozilla/cubeb.git
  git+https://github.com/MerryMage/dynarmic.git
  yuzu-mbedtls::git+https://github.com/yuzu-emu/mbedtls.git
  yuzu-sirit::git+https://github.com/yuzu-emu/sirit.git
  git+https://github.com/herumi/xbyak.git
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd yuzu-mainline
  git config submodule.cpp-httplib.url "${srcdir}"/cpp-httplib
  git config submodule.cpp-jwt.url "${srcdir}"/cpp-jwt
  git config submodule.cubeb.url "${srcdir}"/cubeb
  git config submodule.dynarmic.url "${srcdir}"/dynarmic
  git config submodule.mbedtls.url "${srcdir}"/yuzu-mbedtls
  git config submodule.sirit.url "${srcdir}"/yuzu-sirit
  git config submodule.xbyak.url "${srcdir}"/xbyak
  git -c protocol.file.allow=always submodule update
  cd externals/cubeb
  git config submodule.cmake/sanitizers-cmake.url "${srcdir}"/sanitizers-cmake
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd yuzu-mainline
  git describe --tags | sed 's/.*-//'
}

build() {
  cmake -S yuzu-mainline -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_REPOSITORY=yuzu-emu/yuzu-mainline \
    -DBUILD_TAG=${pkgver} \
    -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
    -DENABLE_QT6=OFF \
    -DENABLE_QT_TRANSLATION=ON \
    -DENABLE_SDL2=ON \
    -DENABLE_WEB_SERVICE=ON \
    -DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
    -DTITLE_BAR_FORMAT_IDLE="yuzu | ${pkgver} {}" \
    -DTITLE_BAR_FORMAT_RUNNING="yuzu | ${pkgver} | {}" \
    -DUSE_DISCORD_PRESENCE=OFF \
    -DYUZU_CHECK_SUBMODULES=OFF \
    -DYUZU_USE_BUNDLED_FFMPEG=OFF \
    -DYUZU_USE_BUNDLED_QT=OFF \
    -DYUZU_USE_BUNDLED_SDL2=OFF \
    -DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
    -DYUZU_USE_EXTERNAL_SDL2=OFF \
    -DYUZU_USE_FASTER_LD=OFF \
    -DYUZU_USE_PRECOMPILED_HEADERS=OFF \
    -DYUZU_USE_QT_MULTIMEDIA=ON \
    -DYUZU_USE_QT_WEB_ENGINE=ON \
    -DYUZU_TESTS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

# vim: ts=2 sw=2 et:
