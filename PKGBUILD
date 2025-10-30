# Maintainer: username227 <gfrank227 [at] gmail [dot] com> 
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=torzu
pkgname=torzu
pkgver=2025.04.16
_pkgver=2025-04-16
pkgrel=3
pkgdesc="Torzu is a fork of yuzu, the world's most popular, open-source, Nintendo Switch emulator. It is written in C++ with portability in mind."
arch=(x86_64)
url=https://notabug.org/litucks/torzu
license=(GPL-3.0-or-later)
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt5-base' 'qt5-multimedia' 'qt5-webengine' 'sdl2' 'zydis' 'ffmpeg4.4' 'zstd' 'libva' 'openssl' 'libusb' 'speexdsp')
makedepends=('git' 'cmake' 'ninja' 'catch2' 'llvm-libs' 'llvm' 'spirv-headers' 'nlohmann-json' 'doxygen' 'vulkan-headers')
optdepends=('gamemode: gamemode support')
options=(!debug)
source=(git+https://notabug.org/litucks/torzu#tag=$_pkgver
  git+https://github.com/lsalzman/enet.git
  cubeb::git+http://github.com/mozilla/cubeb.git
  git+https://github.com/libusb/libusb.git
  git+https://github.com/herumi/xbyak.git
  git+https://github.com/xiph/opus.git
  git+https://github.com/libsdl-org/SDL.git
  git+https://github.com/yhirose/cpp-httplib.git
  git+https://github.com/bylaws/libadrenotools.git
  git+https://github.com/lat9nq/tzdb_to_nx.git
  git+https://github.com/brofield/simpleini.git
  git+https://github.com/merryhime/oaknut.git
  git+https://github.com/KhronosGroup/SPIRV-Tools.git
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
  git+https://github.com/fmtlib/fmt.git
  git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
  git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git
  git+https://github.com/KhronosGroup/Vulkan-Headers.git
  git+https://github.com/arun11299/cpp-jwt.git
  # Submodule Submodules
  git+https://github.com/eggert/tz.git #submodule_of_tzdb_to_nx
  git+https://github.com/bylaws/liblinkernsbypass.git #submodule_of_libadrenogtools
  git+https://github.com/arsenm/sanitizers-cmake.git) #submodule_of_cubeb
b2sums=('24f261fe93e7c1cd118f01862eceffca9f607fe92b53c210356600b70340638826ec03fdd4a6aa6c226053926aa571955c3e57da3eaf99d2de3de09c9952b4fc'
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
prepare() {
  cd "$_pkgname"
  for _submodule in enet cubeb libusb xbyak opus SDL cpp-httplib tzdb_to_nx libadrenotools simpleini cpp-jwt oaknut fmt;
  do
    git config submodule.$_submodule.url ../$_submodule
  done
  git config submodule.externals/SDL.url ../SDL
  git config submodule.externals/VulkanMemoryAllocator.url ../VulkanMemoryAllocator
  git config submodule.externals/SPIRV-Headers.url ../SPIRV-Headers
  git config submodule.externals/SPIRV-Tools.url ../SPIRV-Tools
  git config submodule.externals/Vulkan-Utility-Libraries.url ../Vulkan-Utility-Libraries
  git config submodule.externals/Vulkan-Headers.url ../Vulkan-Headers
  git -c protocol.file.allow=always submodule update
  
  cd $srcdir/$_pkgname/externals/cubeb
  git config submodule.cmake/sanitizers-cmake.url ../../../sanitizers-cmake
  git -c protocol.file.allow=always submodule update
  
  cd $srcdir/$_pkgname/externals/nx_tzdb/tzdb_to_nx
  git config submodule.externals/tz/tz.url ../../../../tz
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir"
   # Fix to help cmake find libusb
  export CXXFLAGS+=" -I/usr/include/libusb-1.0"
  
  cmake -B build -G Ninja -S ${pkgname} \
    -DYUZU_USE_BUNDLED_VCPKG=OFF \
    -DYUZU_USE_QT_WEB_ENGINE=ON \
    -DYUZU_CHECK_SUBMODULES=OFF \
    -DYUZU_USE_CPM=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=None \
    -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
    -DENABLE_QT_TRANSLATION=OFF \
    -DYUZU_USE_EXTERNAL_SDL2=OFF \
    -DYUZU_USE_FASTER_LD=OFF \
    -DYUZU_USE_EXTERNAL_VULKAN_SPIRV_TOOLS=OFF \
    -DYUZU_ENABLE_COMPATIBILITY_REPORTING=${ENABLE_COMPATIBILITY_REPORTING:-"OFF"} \
    -DYUZU_USE_BUNDLED_FFMPEG=OFF \
    -DYUZU_ENABLE_LTO=ON \
    -DYUZU_CRASH_DUMPS=OFF \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DYUZU_ROOM=OFF \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
    -DTITLE_BAR_FORMAT_RUNNING="torzu | ${pkgver} {}" \
    -DTITLE_BAR_FORMAT_IDLE="torzu | ${pkgver} {}" \
    -DFFmpeg_INCLUDE_DIR="/usr/include/ffmpeg4.4" \
  -DFFmpeg_INCLUDE_avcodec="/usr/include/ffmpeg4.4" \
  -DFFmpeg_INCLUDE_avdevice="/usr/include/ffmpeg4.4" \
  -DFFmpeg_INCLUDE_avfilter="/usr/include/ffmpeg4.4" \
  -DFFmpeg_INCLUDE_avformat="/usr/include/ffmpeg4.4" \
  -DFFmpeg_INCLUDE_avutil="/usr/include/ffmpeg4.4" \
  -DFFmpeg_INCLUDE_postproc="/usr/include/ffmpeg4.4" \
  -DFFmpeg_INCLUDE_swscale="/usr/include/ffmpeg4.4" \
  -DFFmpeg_INCLUDE_swresample="/usr/include/ffmpeg4.4" \
  -DFFmpeg_LIBRARY_avcodec="/usr/lib/ffmpeg4.4/libavcodec.so" \
  -DFFmpeg_LIBRARY_avdevice="/usr/lib/ffmpeg4.4/libavdevice.so" \
  -DFFmpeg_LIBRARY_avfilter="/usr/lib/ffmpeg4.4/libavfilter.so" \
  -DFFmpeg_LIBRARY_avformat="/usr/lib/ffmpeg4.4/libavformat.so" \
  -DFFmpeg_LIBRARY_avutil="/usr/lib/ffmpeg4.4/libavutil.so" \
  -DFFmpeg_LIBRARY_swresample="/usr/lib/ffmpeg4.4/libswresample.so" \
  -DFFmpeg_LIBRARY_swscale="/usr/lib/ffmpeg4.4/libswscale.so" \
    -Wno-dev
  cmake --build build
} 

package() {
  DESTDIR="$pkgdir/" cmake --install build

}

