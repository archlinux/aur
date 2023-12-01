# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=yuzu
pkgver=1637
pkgrel=1
pkgdesc='Nintendo Switch emulator'
arch=(x86_64)
url=https://yuzu-emu.org/
license=(GPL3)
depends=(
  brotli
  enet
  gcc-libs
  glibc
  hicolor-icon-theme
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
  qt6-base
  qt6-multimedia
  qt6-webengine
  sdl2
  zlib
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
  qt6-tools
  shaderc
  spirv-headers
  vulkan-headers
)
options=(!debug)
_tag=07d7846c63c001ed04c8434f41b0d48ae5be021e
source=(
  git+https://github.com/yuzu-emu/yuzu-mainline.git#tag=${_tag}
  git+https://github.com/arsenm/sanitizers-cmake.git
  git+https://github.com/yhirose/cpp-httplib.git
  git+https://github.com/arun11299/cpp-jwt.git
  git+https://github.com/mozilla/cubeb.git
  git+https://github.com/MerryMage/dynarmic.git
  git+https://github.com/bylaws/libadrenotools.git
  yuzu-mbedtls::git+https://github.com/yuzu-emu/mbedtls.git
  git+https://github.com/brofield/simpleini.git
  yuzu-sirit::git+https://github.com/yuzu-emu/sirit.git
  git+https://github.com/eggert/tz.git
  git+https://github.com/lat9nq/tzdb_to_nx.git
  git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git
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
  git config submodule.libadrenotools.url "${srcdir}"/libadrenotools
  git config submodule.mbedtls.url "${srcdir}"/yuzu-mbedtls
  git config submodule.simpleini.url "${srcdir}"/simpleini
  git config submodule.sirit.url "${srcdir}"/yuzu-sirit
  git config submodule.tzdb_to_nx.url "${srcdir}"/tzdb_to_nx
  git config submodule.VulkanMemoryAllocator.url "${srcdir}"/VulkanMemoryAllocator
  git config submodule.xbyak.url "${srcdir}"/xbyak
  git -c protocol.file.allow=always submodule update

  pushd externals/cubeb
  git config submodule.cmake/sanitizers-cmake.url "${srcdir}"/sanitizers-cmake
  git -c protocol.file.allow=always submodule update
  popd

  pushd externals/nx_tzdb/tzdb_to_nx
  git config submodule.externals/tz/tz.url "${srcdir}"/tz
  git -c protocol.file.allow=always submodule update
  popd
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
    -DENABLE_QT6=ON \
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
