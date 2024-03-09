# Maintainer: Fijxu <fijxu [at] nadeko [dot] net> 

_pkgname=suyu
_branch=dev
pkgname=suyu-dev-git
pkgver=r27167.d02af377d4
pkgrel=1
pkgdesc="suyu is the afterlife the world's most popular, open-source, Nintendo Switch emulator (dev branch)"
arch=(x86_64)
url=https://gitlab.com/suyu-emu/suyu
license=(GPL3)
provides=(suyu)
install=$pkgname.install
conflicts=(yuzu yuzu-early-access-appimage yuzu-early-access-git)
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
  vulkan-utility-libraries
  zlib
)
makedepends=(
  boost
  clang
  cmake
  ffmpeg
  git
  glslang
  llvm
  ninja
  nlohmann-json
  qt5-tools
  shaderc
  spirv-headers
  vulkan-headers
  catch2
)
options=(!debug lto)
source=(
  git+https://gitlab.com/suyu-emu/suyu.git#branch=${_branch}
  git+https://github.com/arsenm/sanitizers-cmake.git
  git+https://github.com/yhirose/cpp-httplib.git
  git+https://github.com/arun11299/cpp-jwt.git
  git+https://github.com/mozilla/cubeb.git
  git+https://gitlab.com/suyu-emu/dynarmic.git
  git+https://github.com/bylaws/libadrenotools.git
  git+https://gitlab.com/suyu-emu/mbedtls.git
  git+https://github.com/brofield/simpleini.git
  git+https://gitlab.com/suyu-emu/sirit.git
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
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
        'SKIP'
        'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.cpp-httplib.url "${srcdir}"/cpp-httplib
  git config submodule.cpp-jwt.url "${srcdir}"/cpp-jwt
  git config submodule.cubeb.url "${srcdir}"/cubeb
  git config submodule.dynarmic.url "${srcdir}"/dynarmic
  git config submodule.libadrenotools.url "${srcdir}"/libadrenotools
  git config submodule.mbedtls.url "${srcdir}"/mbedtls
  git config submodule.simpleini.url "${srcdir}"/simpleini
  git config submodule.sirit.url "${srcdir}"/sirit
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

  pushd externals/sirit
  git config submodule.externals/SPIRV-Headers.url "${srcdir}"/SPIRV-Headers
  git -c protocol.file.allow=always submodule update
  popd
}

build() {
  export CXXFLAGS+=' -Wno-switch'
  cmake -S suyu -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_REPOSITORY=suyu-emu/suyu \
    -DBUILD_TAG=${_branch}-${pkgver} \
    -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
    -DENABLE_QT6=OFF \
    -DENABLE_QT_TRANSLATION=ON \
    -DENABLE_SDL2=ON \
    -DENABLE_WEB_SERVICE=ON \
    -DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
    -DTITLE_BAR_FORMAT_IDLE="suyu | ${_branch}-${pkgver} {}" \
    -DTITLE_BAR_FORMAT_RUNNING="suyu | ${_branch}-${pkgver} | {}" \
    -DUSE_DISCORD_PRESENCE=OFF \
    -DYUZU_CHECK_SUBMODULES=OFF \
    -DYUZU_DOWNLOAD_TIME_ZONE_DATA=ON \
    -DYUZU_USE_BUNDLED_FFMPEG=OFF \
    -DYUZU_USE_BUNDLED_QT=OFF \
    -DYUZU_USE_BUNDLED_SDL2=OFF \
    -DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
    -DYUZU_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
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
  mv ${pkgdir}/usr/bin/yuzu ${pkgdir}/usr/bin/suyu
  ln -s ${pkgdir}/usr/bin/suyu ${pkgdir}/usr/bin/yuzu
  mv ${pkgdir}/usr/bin/yuzu-cmd ${pkgdir}/usr/bin/suyu-cmd
  ln -s ${pkgdir}/usr/bin/suyu-cmd ${pkgdir}/usr/bin/yuzu-cmd
  mv ${pkgdir}/usr/bin/yuzu-room ${pkgdir}/usr/bin/suyu-room
  ln -s ${pkgdir}/usr/bin/suyu-room ${pkgdir}/usr/bin/yuzu-room
  install -Dm644 ${_pkgname}/dist/72-yuzu-input.rules -t "${pkgdir}"/usr/lib/udev/rules.d/
}

# vim: ts=2 sw=2 et:
