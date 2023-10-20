# Maintainer: xiota / aur.chaotic.cx

_pkgname=flycast
pkgname="$_pkgname"
pkgver=2.1
_tag="V${pkgver%%.r*}"
pkgrel=3
pkgdesc='A multi-platform Sega Dreamcast, Naomi and Atomiswave emulator'
arch=('x86_64' 'i686')
url="https://github.com/flyinghead/flycast"
license=('GPL2')

depends=(
  'alsa-lib'
  'hicolor-icon-theme'
  'libgl'
  'libzip'
)
makedepends=(
  'cmake'
  'git'
  'python'
  'systemd'
)

provides=(reicast)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname"
  source+=(
    "$_pkgsrc"::"git+$url.git#tag=$_tag"
  )
  sha256sums+=(
    'SKIP'
  )

  pkgver() {
    cd "$_pkgsrc"
    echo "${pkgver%%.r*}"
  }
else
  # git package
  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=(
    "$_pkgsrc"::"git+$url.git"

    # submodules
    'Spout'::'git+https://github.com/vkedwardli/Spout2'
    'Syphon'::'git+https://github.com/vkedwardli/Syphon-Framework'
  )
  sha256sums+=(
    'SKIP'

    'SKIP'
    'SKIP'
  )

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed -E 's/^[Vv]//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

source+=(
  # common submodules
  "SDL"::"git+https://github.com/libsdl-org/SDL"
  "Vulkan-Headers"::"git+https://github.com/KhronosGroup/Vulkan-Headers"
  "VulkanMemoryAllocator"::"git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator"
  "breakpad"::"git+https://github.com/flyinghead/mingw-breakpad"
  "glslang"::"git+https://github.com/KhronosGroup/glslang"
  "libchdr"::"git+https://github.com/flyinghead/libchdr"
  "luabridge"::"git+https://github.com/vinniefalco/LuaBridge"
  "oboe"::"git+https://github.com/google/oboe"
)
sha256sums+=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$_pkgsrc"

  local _submodules=(
    'core/deps/SDL'
    'core/deps/Vulkan-Headers'
    'core/deps/VulkanMemoryAllocator'
    'core/deps/breakpad'
    'core/deps/glslang'
    'core/deps/libchdr'
    'core/deps/luabridge'
    'core/deps/oboe'
  )

  if [ x"${pkgname: -4}" == x"-git" ] ; then
    _submodules+=(
      'core/deps/Spout'
      'core/deps/Syphon'
    )
  fi

  for submodule in "${_submodules[@]}" ; do
    git submodule init "${submodule}"
    git submodule set-url "${submodule}" "${srcdir}/${submodule##*/}"
    git -c protocol.file.allow=always submodule update "${submodule}"
  done

  # add missing includes
  local _file='core/deps/breakpad/src/client/linux/handler/minidump_descriptor.h'
  if ! grep cstdint "$_file" > /dev/null ; then
    sed -Ei 's@^(#include "common/using_std_string.h")$@\1\n#include <cstdint>@' "$_file"
  fi
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX='/usr'
  )
  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
