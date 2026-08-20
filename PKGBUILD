# Maintainer:

# options
: ${_build_clang:=false}

: ${_use_sodeps:=false}

_pkgname="flycast"
pkgname="$_pkgname"
pkgver=2.7
pkgrel=1
pkgdesc='Sega Dreamcast, Naomi, and Atomiswave emulator'
url="https://github.com/flyinghead/flycast"
license=('GPL-2.0-only')
arch=('x86_64')

depends=(
  alsa-lib
  freetype2
  glslang
  hicolor-icon-theme
  libao
  libcdio
  libgomp
  libjuice
  libpulse
  libzip
  lua
  miniupnpc
  sdl2
  systemd-libs
  zlib
)
makedepends=(
  cmake
  git
  ninja
  python
  vulkan-headers
)

if [[ "${_build_clang::1}" == "t" ]]; then
  makedepends+=(
    'clang'
    'lld'
  )
fi

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('225adbf6c41ee2f841e34aeffe13367cafba938aed769a2509f007d0ec902450')

prepare() {
  cd "$_pkgsrc"
  git rm -r core/deps/SDL
  git rm -r core/deps/Vulkan-Headers
  git rm -r core/deps/breakpad
  git rm -r core/deps/freetype
  git rm -r core/deps/gamesdk
  git rm -r core/deps/glslang
  git rm -r core/deps/googletest
  git rm -r core/deps/libjuice
  git rm -r core/deps/oboe
  git submodule update --init --depth=1

  git -C core/deps/DreamPicoPort-API submodule update --init --depth=1
  git -C core/deps/tinygettext submodule update --init --depth=1

  # use system vulkan-headers
  sed -E -e '/add_subdirectory/s&^.*Vulkan-Headers.*$&find_package(VulkanHeaders)&' -i CMakeLists.txt

  # use system libjuice
  sed -E -e 's&(LibJuice)Static&\1&' \
    -e '/add_subdirectory/s&^.*libjuice.*$&find_package(LibJuice)&' \
    -i CMakeLists.txt

  # use system freetype2
  sed -E -e '/\bFT_/d' \
    -e '/add_subdirectory/s&^.*freetype.*$&find_package(FreeType2 REQUIRED)&' \
    -e '/target_link_libraries/s&freetype&FreeType2::FreeType2&' \
    -i CMakeLists.txt

  # find module for freetype2
  install -Dm644 /dev/stdin shell/cmake/FindFreeType2.cmake << 'END'
include(FindPkgConfig)
pkg_check_modules(FREETYPE2 REQUIRED freetype2)

add_library(FreeType2::FreeType2 INTERFACE IMPORTED)

set(FREETYPE2_FOUND TRUE)
set(FREETYPE2_INCLUDE_DIRS ${FREETYPE2_INCLUDE_DIRS})
set(FREETYPE2_LIBRARIES ${FREETYPE2_LIBRARIES})

target_include_directories(FreeType2::FreeType2 INTERFACE ${FREETYPE2_INCLUDE_DIRS})
target_link_libraries(FreeType2::FreeType2 INTERFACE ${FREETYPE2_LIBRARIES})
target_compile_options(FreeType2::FreeType2 INTERFACE ${FREETYPE2_CFLAGS_OTHER})
END
}

build() {
  if [[ "${_build_clang::1}" == "t" ]]; then
    export CC CXX LDFLAGS
    CC=clang
    CXX=clang++
    LDFLAGS+=" -fuse-ld=lld"
  fi

  export CFLAGS CXXFLAGS
  CFLAGS+=" -DNDEBUG"
  CXXFLAGS+=" -DNDEBUG"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=$CHECKFUNC
    -Wno-author

    -DUSE_BREAKPAD=OFF
    -DUSE_HOST_GLSLANG=ON
    -DUSE_HOST_SDL=ON
    -DUSE_LIBCDIO=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      libao.so
      libasound.so
      libcurl.so
      libfreetype.so
      libgomp.so
      libminiupnpc.so
      libpulse.so
      libudev.so
      libz.so
      libzip.so
    )"
  fi

  DESTDIR="$pkgdir" cmake --install build

  echo "Removing unwanted files..."
  rm -rfv "$pkgdir"/usr/{include,lib,share/pixmaps}
}
