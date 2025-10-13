# Maintainer:

# options
: ${_build_clang:=false}

_pkgname="flycast"
pkgname="$_pkgname"
pkgver=2.5
pkgrel=3
pkgdesc='Sega Dreamcast, Naomi, and Atomiswave emulator'
url="https://github.com/flyinghead/flycast"
license=('GPL-2.0-only')
arch=('x86_64')

depends=(
  'alsa-lib'
  'hicolor-icon-theme'
  'libao'
  'libcdio'
  'libgl'
  'libpulse'
  'libzip'
  'miniupnpc'
  'sdl2'
)
makedepends=(
  'cmake'
  'git'
  'glslang'
  'ninja'
  'python'
  'vulkan-headers'
)

if [[ "${_build_clang::1}" == "t" ]]; then
  makedepends+=(
    'clang'
    'lld'
  )
fi

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('b76ec69017b8e3fa6f1815ee8cb8396d7f56d0928d21fa85c3a196e94ee24fa7')

prepare() {
  cd "$_pkgsrc"
  git rm -r core/deps/SDL
  git rm -r core/deps/Vulkan-Headers
  git rm -r core/deps/breakpad
  git rm -r core/deps/glslang
  git rm -r core/deps/googletest
  git rm -r core/deps/oboe
  git submodule update --init --depth=1

  # use system vulkan-headers
  sed -E -e '/add_subdirectory/s&^.*Vulkan-Headers.*$&find_package(VulkanHeaders)&' -i CMakeLists.txt

  sed -E -e 's&vk::(resultCheck|DynamicLoader)&vk::detail::\1&' \
    -i core/rend/vulkan/vmallocator.cpp \
    core/rend/vulkan/vmallocator.h \
    core/rend/vulkan/vulkan_context.cpp

  # fix missing headers
  sed -e '1i #include <cstddef>' -i core/network/miniupnp.cpp
  sed -e '1i #include <set>' -i core/rend/vulkan/vulkan_context.cpp
}

build() {
  if [[ "${_build_clang::1}" == "t" ]]; then
    export CC CXX LDFLAGS
    CC=clang
    CXX=clang++
    LDFLAGS="$(sed -E -e 's/\S*fuse-ld\S*//g' <<< "$LDFLAGS") -fuse-ld=lld"
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
    -Wno-dev

    -DUSE_BREAKPAD=OFF
    -DUSE_HOST_GLSLANG=ON
    -DUSE_HOST_SDL=ON
    -DUSE_LIBCDIO=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
