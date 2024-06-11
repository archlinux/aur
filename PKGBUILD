# Maintainer: username227 <gfrank227 [at] gmail [dot] com> 
_pkgname=sudachi
_branch=main
pkgname=sudachi-git
pkgver=r52.50ad683
pkgrel=1
pkgdesc="Sudachi is a Nintendo Switch emulator for Android, Linux, macOS and Windows, written in C++"
arch=(x86_64)
url=https://github.com/sudachi-emu/sudachi
license=(GPL-3.0-or-later)
provides=('suyu')
conflicts=('sudachi-bin')
provides=('sudachi' 'sudachi-cmd')
depends=('alsa-lib' 'brotli' 'catch2' 'enet' 'llvm-libs' 'freetype2' 'gcc-libs' 'glibc' 'glu' 'hicolor-icon-theme' 'gamemode' 'libass' 'libpulse' 'libtool' 'libvdpau' 'lz4' 'qt5-base' 'qt5-multimedia' 'qt5-webengine' 'sdl2' 'zlib')
makedepends=('curl' 'autoconf' 'cmake' 'gcc13' 'git' 'glslang' 'alsa-lib' 'glu' 'hidapi' 'libpulse' 'systemd-libs' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libxcb' 'libxext' 'libxkbcommon-x11' 'nasm' 'qt5-base' 'qt5-webengine' 'qt5-multimedia' 'mbedtls2' 'fmt' 'nlohmann-json' 'zstd' 'openssl' 'libunistring' 'aom' 'automake' 'base-devel' 'libass' 'freetype2' 'haskell-gnutls' 'lame' 'sdl2' 'libva' 'libvorbis' 'libxcb' 'meson' 'ninja' 'pkgconf' 'texinfo' 'wget' 'vasm' 'x264' 'x265' 'numactl' 'libvpx' 'libfdk-aac' 'libopusenc' 'ffmpeg' 'svt-av1' 'dav1d' 'boost' 'clang' 'vulkan-headers' 'ffmpeg4.4' 'zip' 'unzip' 'tar' 'boost-libs')
options=(!debug lto strip)
source=(
  git+https://github.com/sudachi-emu/sudachi#branch=${_branch}
  git+https://github.com/lsalzman/enet.git
  cubeb::git+http://github.com/mozilla/cubeb.git
  dynarmic::git+https://github.com/sudachi-emu/dynarmic.git
  git+https://github.com/libusb/libusb.git
  git+https://github.com/sudachi-emu/discord-rpc.git
  git+https://github.com/KhronosGroup/Vulkan-Headers.git
  git+https://github.com/sudachi-emu/sirit.git
  git+https://github.com/sudachi-emu/mbedtls.git
  xbyak::git+https://github.com/herumi/xbyak.git
  git+https://github.com/xiph/opus.git
  git+https://github.com/libsdl-org/SDL.git
  git+https://github.com/yhirose/cpp-httplib.git
  ffmpeg::git+https://github.com/FFmpeg/FFmpeg.git
  git+https://github.com/microsoft/vcpkg.git
  git+https://github.com/arun11299/cpp-jwt.git
  git+https://github.com/bylaws/libadrenotools.git
  git+https://github.com/lat9nq/tzdb_to_nx.git
  git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git
  git+https://github.com/sudachi-emu/breakpad.git
  git+https://github.com/brofield/simpleini.git
  git+https://github.com/sudachi-emu/oaknut.git
  git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
  # Submodule Submodules
  git+https://github.com/arsenm/sanitizers-cmake.git
  git+https://github.com/zyantific/zycore-c.git
  git+https://github.com/bylaws/liblinkernsbypass.git
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
  git+https://github.com/eggert/tz.git
  git+https://github.com/google/googletest.git
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
        'SKIP'
        'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  for submodule in {enet,cubeb,dynarmic,libusb,discord-rpc,Vulkan-Headers,sirit,mbedtls,xbyak,opus,SDL,cpp-httplib,ffmpeg,vcpkg,cpp-jwt,libadrenotools,tzdb_to_nx,VulkanMemoryAllocator,breakpad,simpleini,oaknut,Vulkan-Utility-Libraries};
  do
    git config --file=.gitmodules submodule.$submodule.url "${srcdir}"/$submodule
  done
  git -c protocol.file.allow=always submodule update --init

  pushd externals/cubeb
  for submodule in {sanitiers-cmake,googletest};
  do
  git config --file=.gitmodules submodule.$submodule.url "${srcdir}"/$submodule
  done
  git -c protocol.file.allow=always submodule update --init
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
  cd "$srcdir/sudachi"
   # Fix to help cmake find libusb
  CXXFLAGS+=" -I/usr/include/libusb-1.0"
  
  cmake -B build -G Ninja \
    -DSUDACHI_USE_BUNDLED_VCPKG=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="-march=x86-64-v2" \
    -DCMAKE_CXX_COMPILER=/usr/bin/g++-13 \
    -DCMAKE_C_COMPILER=/usr/bin/gcc-13 \
    -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
    -DENABLE_QT_TRANSLATION=OFF \
    -DUSE_DISCORD_PRESENCE=ON \
    -DSUDACHI_ENABLE_COMPATIBILITY_REPORTING=${ENABLE_COMPATIBILITY_REPORTING:-"OFF"} \
    -DSUDACHI_USE_BUNDLED_FFMPEG=ON \
    -DSUDACHI_ENABLE_LTO=ON \
    -DSUDACHI_CRASH_DUMPS=OFF \
    -DSUDACHI_USE_FASTER_LD=OFF \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DSUDACHI_ROOM=OFF \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
    -DFFmpeg_COMPONENTS="swscale;avutil;avfilter;avcodec" \
    -DFFmpeg_PREFIX=$srcdir/externals/ffmpeg/ffmpeg \
    -GNinja \
    -Wno-dev
  ninja -C build
} 

package() {
  DESTDIR="$pkgdir/" ninja -C $srcdir/sudachi/build install

}

