pkgname=mingw-w64-pcsx2
pkgver=1.7.2184
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator (mingw-w64)'
depends=('mingw-w64-rapidyaml' 'mingw-w64-wxmsw3.1' 'mingw-w64-xz' 'mingw-w64-libpng' 'mingw-w64-soundtouch')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='https://www.pcsx2.net'
license=('GPL3')
source=("git+https://github.com/PCSX2/pcsx2.git#tag=v${pkgver}")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/pcsx2
  git submodule update --force --init --recursive
  curl -L https://github.com/PCSX2/pcsx2/pull/5243.patch | patch -p1
  sed -i "/#define _inline /d" common/Pcsx2Defs.h
  sed -i "/#define __forceinline /d" common/Pcsx2Defs.h
  sed -i "/#define CALLBACK /d" common/Pcsx2Defs.h
  sed -i "s|target_sources(common PRIVATE FastJmp.asm)||g" common/CMakeLists.txt
  sed -i "s|FastJmp.asm||g" common/CMakeLists.txt
  sed -i "/__fastcall _aligned_malloc/d" common/AlignedMalloc.h

  # patched in mingw
  sed -i "s|#include <timeapi.h>||g" common/RedtapeWindows.h
  sed -i "s|ERROR_COMMITMENT_MINIMUM|635|g" common/Windows/WinHostSys.cpp

  sed -i "/baseclasses/d" cmake/SearchForStuff.cmake
  cp 3rdparty/baseclasses/schedule.h 3rdparty/baseclasses/Schedule.h
  # unbundle dependencies
  sed -i "/pthreads4w/d" cmake/SearchForStuff.cmake
  sed -i "s|pthreads4w||g" common/CMakeLists.txt
  sed -i "s|add_subdirectory(3rdparty/soundtouch EXCLUDE_FROM_ALL)|include(CheckLib)\ncheck_lib(SOUNDTOUCH SoundTouch SoundTouch.h PATH_SUFFIXES soundtouch)|g" cmake/SearchForStuff.cmake
  sed -i "s|add_subdirectory(3rdparty/xz EXCLUDE_FROM_ALL)|find_package(LibLZMA REQUIRED)|g" cmake/SearchForStuff.cmake
  sed -i "s|add_subdirectory(3rdparty/zlib EXCLUDE_FROM_ALL)|find_package(ZLIB REQUIRED)|g" cmake/SearchForStuff.cmake
  sed -i "s|add_subdirectory(3rdparty/libpng EXCLUDE_FROM_ALL)|find_package(PNG REQUIRED)|g" cmake/SearchForStuff.cmake
  sed -i "s|add_subdirectory(3rdparty/libjpeg EXCLUDE_FROM_ALL)|find_package(JPEG REQUIRED)|g" cmake/SearchForStuff.cmake
  sed -i "s|add_subdirectory(3rdparty/wxwidgets3.0 EXCLUDE_FROM_ALL)|find_package(wxWidgets REQUIRED base core adv)\ninclude(\${wxWidgets_USE_FILE})\nmake_imported_target_if_missing(wxWidgets::all wxWidgets)|g" cmake/SearchForStuff.cmake
}

build() {
  cd "$srcdir"/pcsx2
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DDISABLE_ADVANCE_SIMD=ON \
      -DDISABLE_BUILD_DATE=ON \
      -DDISABLE_PCSX2_WRAPPER=ON \
      -DDISABLE_SETCAP=ON \
      -DENABLE_TESTS=OFF \
      -DLTO_PCSX2_CORE=ON \
      -DPACKAGE_MODE=ON \
      -DSDL2_API=ON \
      -DUSE_SYSTEM_YAML=ON \
      -DUSE_VTUNE=OFF \
      -DwxWidgets_INCLUDE_DIR="/usr/${_arch}/include/wx-3.1" \
      -DwxWidgets_LIBRARIES="/usr/${_arch}/lib/libwx_mswu_adv-3.1-${_arch}.a;/usr/${_arch}/lib/libwx_mswu_core-3.1-${_arch}.a;/usr/${_arch}/lib/libwx_mswu_gl-3.1-${_arch}.a" \
      -DWIL_BUILD_TESTS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/pcsx2-${pkgver}/build-${_arch}
    make install DESTDIR="${pkgdir}"
#     ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
#     ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

