# Maintainer: Fijxu <fijxu [at] nadeko [dot] net> 

_pkgname=suyu
_branch=dev
pkgname=suyu-dev-git
pkgver=r27175.bd5bdbe6c
pkgrel=1
pkgdesc="suyu is the afterlife the world's most popular, open-source, Nintendo Switch emulator (dev branch)"
arch=(x86_64)
url=https://gitlab.com/suyu-emu/suyu
license=(GPL-3.0-or-later)
provides=('suyu')
install=$pkgname.install
depends=(
  brotli
  enet
  llvm-libs
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
  libusb-1.0.so
  libva.so
  libzstd.so
  lz4
  qt5-base
  qt5-multimedia
  qt5-webengine
  sdl2
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
  vulkan-utility-libraries
  catch2
  rapidjson
  mbedtls
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
  if [[ $CXXFLAGS == *"-flto"* ]]; then
    flags+=("-DSUYU_ENABLE_LTO=ON")
  fi
  export CXXFLAGS+=' -Wno-switch'
  cmake -S suyu -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_REPOSITORY=suyu-emu/suyu \
    -DBUILD_TAG=${_branch}-${pkgver} \
    -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=OFF \
    -DENABLE_QT6=OFF \
    -DENABLE_QT_TRANSLATION=ON \
    -DENABLE_SDL2=ON \
    -DENABLE_WEB_SERVICE=ON \
    -DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
    -DTITLE_BAR_FORMAT_IDLE="suyu | ${_branch}-${pkgver} {}" \
    -DTITLE_BAR_FORMAT_RUNNING="suyu | ${_branch}-${pkgver} | {}" \
    -DUSE_DISCORD_PRESENCE=ON \
    -DSUYU_CHECK_SUBMODULES=OFF \
    -DSUYU_DOWNLOAD_TIME_ZONE_DATA=ON \
    -DSUYU_USE_BUNDLED_FFMPEG=OFF \
    -DSUYU_USE_BUNDLED_QT=OFF \
    -DSUYU_USE_BUNDLED_SDL2=OFF \
    -DSUYU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
    -DSUYU_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
    -DSUYU_USE_EXTERNAL_SDL2=OFF \
    -DSUYU_USE_FASTER_LD=ON \
    -DSUYU_USE_PRECOMPILED_HEADERS=OFF \
    -DSUYU_USE_QT_MULTIMEDIA=ON \
    -DSUYU_USE_QT_WEB_ENGINE=ON \
    -DSUYU_TESTS=OFF \
    "${flags[@]}" \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 ${_pkgname}/dist/72-suyu-input.rules -t "${pkgdir}"/usr/lib/udev/rules.d/
}

# vim: ts=2 sw=2 et
