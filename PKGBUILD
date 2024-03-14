# Maintainer: Fijxu <fijxu [at] nadeko [dot] net> 
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

_pkgname=suyu
_branch=dev
pkgname=suyu-dev-git
pkgver=r27189.8b8aa84e70
pkgrel=1
pkgdesc="suyu is the afterlife the world's most popular, open-source, Nintendo Switch emulator (dev branch)"
arch=(x86_64)
url=https://gitlab.com/suyu-emu/suyu
license=(GPL-3.0-or-later)
provides=('suyu')
conflicts=(suyu-git suyu-dev-qt6-git)
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
options=(!debug lto strip)
source=(
  git+https://gitlab.com/suyu-emu/suyu.git#branch=${_branch}
  git+https://github.com/lsalzman/enet.git
  git+https://github.com/mozilla/cubeb.git
  git+https://gitlab.com/suyu-emu/dynarmic.git
  git+https://github.com/libusb/libusb.git
  git+https://github.com/suyu-emu/discord-rpc.git
  git+https://github.com/KhronosGroup/Vulkan-Headers.git
  git+https://gitlab.com/suyu-emu/sirit.git
  git+https://gitlab.com/suyu-emu/mbedtls.git
  git+https://github.com/herumi/xbyak.git
  git+https://github.com/xiph/opus.git
  git+https://github.com/libsdl-org/SDL.git
  git+https://github.com/yhirose/cpp-httplib.git
  ffmpeg::git+https://github.com/FFmpeg/FFmpeg.git
  git+https://github.com/microsoft/vcpkg.git
  git+https://github.com/arun11299/cpp-jwt.git
  git+https://github.com/bylaws/libadrenotools.git
  git+https://github.com/lat9nq/tzdb_to_nx.git
  git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git
  git+https://gitlab.com/suyu-emu/breakpad.git
  git+https://github.com/brofield/simpleini.git
  git+https://github.com/merryhime/oaknut.git
  git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
  # Submodule Submodules
  git+https://github.com/arsenm/sanitizers-cmake.git
  git+https://github.com/zyantific/zycore-c.git
  git+https://github.com/bylaws/liblinkernsbypass.git
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
  git+https://github.com/eggert/tz.git
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
  for submodule in {enet,cubeb,dynarmic,libusb,discord-rpc,Vulkan-Headers,sirit,mbedtls,xbyak,opus,SDL,cpp-httplib,ffmpeg,vcpkg,cpp-jwt,libadrenotools,tzdb_to_nx,VulkanMemoryAllocator,breakpad,simpleini,oaknut,Vulkan-Utility-Libraries};
  do
    git config submodule.$submodule.url "${srcdir}"/$submodule
  done
  git -c protocol.file.allow=always submodule update
  git -c protocol.file.allow=always submodule update

  pushd externals/cubeb
  git config submodule.cmake/sanitizers-cmake.url "${srcdir}"/sanitizers-cmake
  git -c protocol.file.allow=always submodule update
  popd

  pushd externals/dynarmic/externals/zydis
  git config submodule.dependencies/zycore.url "${srcdir}"/zycore
  git -c protocol.file.allow=always submodule update
  popd

  pushd externals/libadrenotools
  git config submodule.lib/linkersbypass.url "${srcdir}"/linkernsbypass
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
    -DSUYU_CHECK_SUBMODULES=ON \
    -DSUYU_DOWNLOAD_TIME_ZONE_DATA=ON \
    -DSUYU_USE_BUNDLED_FFMPEG=OFF \
    -DSUYU_USE_BUNDLED_QT=OFF \
    -DSUYU_USE_BUNDLED_SDL2=OFF \
    -DSUYU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
    -DSUYU_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
    -DSUYU_USE_EXTERNAL_SDL2=OFF \
    -DSUYU_USE_FASTER_LD=OFF \
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

  cd "${pkgdir}"/usr/share/applications
  sed -i '12s/Exec=suyu/Exec=env QT_QPA_PLATFORM=xcb yuzu/' org.suyu_emu.suyu.desktop
}

# vim: ts=2 sw=2 et
