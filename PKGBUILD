# Maintainer:
# Contributor: Manuel <mdomlop@gmail.com>

# options
: ${_build_clang:=true}

: ${_build_avx:=false}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname=flycast
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.3.2.r167.g6b3e866
pkgrel=1
pkgdesc='Sega Dreamcast, Naomi, and Atomiswave emulator'
url="https://github.com/flyinghead/flycast"
license=('GPL-2.0-only')
arch=('x86_64' 'i686')

depends=(
  'alsa-lib'
  'libgl'
  'libzip'
)
makedepends=(
  'cmake'
  'git'
  'python'
)

if [[ "${_build_clang::1}" == "t" ]]; then
  makedepends+=(
    'clang'
    'lld'
    'llvm'
  )
fi

_source_flycast() {
  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=(
    "$_pkgsrc"::"git+$url.git"
    'breakpad-disable.patch'
  )
  sha256sums=(
    'SKIP'
    '0a6a9c7bc3ba1fc3ca9bdd3134e722f6db73f2a222990e49cabae8fb687c0beb'
  )

  source+=(
    'bylaws.libadrenotools'::'git+https://github.com/bylaws/libadrenotools.git'
    'flyinghead.mingw-breakpad'::'git+https://github.com/flyinghead/mingw-breakpad.git'
    'google.googletest'::'git+https://github.com/google/googletest.git'
    'google.oboe'::'git+https://github.com/google/oboe.git'
    'gpuopen-librariesandsdks.vulkanmemoryallocator'::'git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
    'harmonytf.discord-rpc'::'git+https://github.com/harmonytf/discord-rpc.git'
    'khronosgroup.glslang'::'git+https://github.com/KhronosGroup/glslang.git'
    'khronosgroup.vulkan-headers'::'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
    'libsdl-org.sdl'::'git+https://github.com/libsdl-org/SDL.git'
    'retroachievements.rcheevos'::'git+https://github.com/RetroAchievements/rcheevos.git'
    'rtissera.libchdr'::'git+https://github.com/rtissera/libchdr.git'
    'vinniefalco.luabridge'::'git+https://github.com/vinniefalco/LuaBridge.git'
    'vkedwardli.spout2'::'git+https://github.com/vkedwardli/Spout2.git'
    'vkedwardli.syphon-framework'::'git+https://github.com/vkedwardli/Syphon-Framework.git'
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
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )
}

_prepare_flycast() (
  cd "$srcdir/$_pkgsrc"
  local _submodules=(
    'bylaws.libadrenotools'::'core/deps/libadrenotools'
    'flyinghead.mingw-breakpad'::'core/deps/breakpad'
    'google.googletest'::'core/deps/googletest'
    'google.oboe'::'core/deps/oboe'
    'gpuopen-librariesandsdks.vulkanmemoryallocator'::'core/deps/VulkanMemoryAllocator'
    'harmonytf.discord-rpc'::'core/deps/discord-rpc'
    'khronosgroup.glslang'::'core/deps/glslang'
    'khronosgroup.vulkan-headers'::'core/deps/Vulkan-Headers'
    'libsdl-org.sdl'::'core/deps/SDL'
    'retroachievements.rcheevos'::'core/deps/rcheevos'
    'rtissera.libchdr'::'core/deps/libchdr'
    'vinniefalco.luabridge'::'core/deps/luabridge'
    'vkedwardli.spout2'::'core/deps/Spout'
    'vkedwardli.syphon-framework'::'core/deps/Syphon'
  )
  _submodule_update
)

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  apply-patch() {
    if patch -Np1 -F100 --dry-run -i "$1" &> /dev/null; then
      printf '\nApplying patch: %s\n' "$1"
      patch -Np1 -F100 -i "$1"
    else
      printf '\nPatch already applied: %s\n' "$1"
    fi
  }

  _prepare_flycast

  cd "$_pkgsrc"
  apply-patch "$srcdir/breakpad-disable.patch"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_BUILD_TYPE=Release
    -Wno-dev
  )

  if [[ "${_build_clang::1}" == "t" ]]; then
    export CC=clang
    export CXX=clang++
    export LDFLAGS+=" -fuse-ld=lld"
  fi

  if [[ "${_build_avx::1}" == "t" ]]; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=(
    'hicolor-icon-theme'
  )

  DESTDIR="$pkgdir" cmake --install build
}

_source_flycast
