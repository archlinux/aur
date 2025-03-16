# Maintainer:
# Contributor: Manuel <mdomlop@gmail.com>

# options
: ${_build_clang:=true}

: ${_build_level:=1}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_level::1}" == "2" ]] && _pkgtype+="-x64v2"
[[ "${_build_level::1}" == "3" ]] && _pkgtype+="-avx"
[[ "${_build_level::1}" == "4" ]] && _pkgtype+="-x64v4"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

_pkgname=flycast
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.4.r232.g44f7740
pkgrel=1
pkgdesc='Sega Dreamcast, Naomi, and Atomiswave emulator'
url="https://github.com/flyinghead/flycast"
license=('GPL-2.0-only')
arch=('x86_64' 'x86_64_v2' 'x86_64_v3' 'x86_64_v4')

depends=(
  'alsa-lib'
  'hicolor-icon-theme'
  'libgl'
  'libzip'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'python'
)

if [[ "${_build_clang::1}" == "t" ]]; then
  makedepends+=(
    'clang'
    'lld'
    'llvm'
  )
fi

_source_main() {
  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')
}

_source_flycast() {
  local _sources_add=(
    'bylaws.libadrenotools'::'git+https://github.com/bylaws/libadrenotools.git'
    'flyinghead.asio'::'git+https://github.com/flyinghead/asio.git'
    #'flyinghead.mingw-breakpad'::'git+https://github.com/flyinghead/mingw-breakpad.git'
    #'google.googletest'::'git+https://github.com/google/googletest.git'
    #'google.oboe'::'git+https://github.com/google/oboe.git'
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

  local _p
  for _p in ${_sources_add[@]}; do
    source+=("$_p")
    sha256sums+=('SKIP')
  done

  _prepare_flycast() (
    cd "$srcdir/$_pkgsrc"
    local _submodules=(
      'bylaws.libadrenotools'::'core/deps/libadrenotools'
      'flyinghead.asio'::'core/deps/asio'
      #'flyinghead.mingw-breakpad'::'core/deps/breakpad'
      #'google.googletest'::'core/deps/googletest'
      #'google.oboe'::'core/deps/oboe'
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
}

_source_main
_source_flycast

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _run_if_exists _prepare_flycast
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  if [[ "${_build_clang::1}" == "t" ]]; then
    local _ldflags
    export CC CXX LDFLAGS
    CC=clang
    CXX=clang++

    _ldflags=(${LDFLAGS})
    LDFLAGS="${_ldflags[@]//-fuse-ld=*/} -fuse-ld=lld"
  fi

  if [[ ${_build_level::1} =~ ^[2-4]$ ]]; then
    local _cflags _cxxflags
    _cflags=(
      -march=x86-64-v${_build_level::1} -mtune=generic -O3
      $(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CFLAGS}")
    )
    CFLAGS="${_cflags[@]}"

    _cxxflags=(
      -march=x86-64-v${_build_level::1} -mtune=generic -O3
      $(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CXXFLAGS}")
    )
    CXXFLAGS="${_cxxflags[@]}"
  fi

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DUSE_BREAKPAD=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}
