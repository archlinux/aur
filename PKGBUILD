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
    echo "${pkgver%%.r*}"
  }

  prepare() {
    _prepare_submodules_common
    _prepare_common
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

  prepare() {
    _prepare_submodules_common
    _prepare_submodules_git
    _prepare_common
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

_prepare_submodules_common() {
  (
    # submodules for flycast
    cd "$_pkgsrc"
    local -A _submodules=(
      ['breakpad']='core/deps/breakpad'
      ['VulkanMemoryAllocator']='core/deps/VulkanMemoryAllocator'
      ['glslang']='core/deps/glslang'
      ['libchdr']='core/deps/libchdr'
      ['Vulkan-Headers']='core/deps/Vulkan-Headers'
      ['SDL']='core/deps/SDL'
      ['oboe']='core/deps/oboe'
      ['luabridge']='core/deps/luabridge'
    )
     for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  )
}

_prepare_submodules_git() {
  (
    # submodules for flycast
    cd "$_pkgsrc"
    local -A _submodules=(
      ['Spout']='core/deps/Spout'
      ['Syphon']='core/deps/Syphon'
    )
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  )
}

_prepare_common() {
  (
    cd "$_pkgsrc"

    # add missing includes
    local _file='core/deps/breakpad/src/client/linux/handler/minidump_descriptor.h'
    if ! grep cstdint "$_file" > /dev/null ; then
      sed -Ei 's@^(#include "common/using_std_string.h")$@\1\n#include <cstdint>@' "$_file"
    fi
  )
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
  DESTDIR="${pkgdir:?}" cmake --install build
}
