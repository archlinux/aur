# Maintainer:

# options
: ${_autoupdate:=false}

: ${_build_clang:=true}

: ${_build_avx:=false}
: ${_build_git:=false}

unset _pkgtype
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname=flycast
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.3
pkgrel=1
pkgdesc='Sega Dreamcast, Naomi, and Atomiswave emulator'
url="https://github.com/flyinghead/flycast"
license=('GPL-2.0-only')
arch=('x86_64' 'i686')

# main package
_main_package() {
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

  if [[ "${_build_clang::1}" == "t" ]] ; then
    makedepends+=(
      'clang'
      'lld'
      'llvm'
    )
  fi

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi

  source+=("breakpad-disable.patch")
  sha256sums+=('SKIP')

  _source_flycast
  #_source_vinniefalco_luabridge
}

# stable package
_main_stable() {
  _update_version

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=v$_pkgver")
  sha256sums+=('SKIP')

  _prepare() {
    :
  }

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  _prepare() {
    :
  }

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

# submodules
_source_flycast() {
  source+=(
    'flyinghead.mingw-breakpad'::'git+https://github.com/flyinghead/mingw-breakpad.git'
    'google.oboe'::'git+https://github.com/google/oboe.git'
    'gpuopen-librariesandsdks.vulkanmemoryallocator'::'git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
    'khronosgroup.glslang'::'git+https://github.com/KhronosGroup/glslang.git'
    'khronosgroup.vulkan-headers'::'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
    'libsdl-org.sdl'::'git+https://github.com/libsdl-org/SDL.git'
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
  )

  _prepare_flycast() (
    cd "$srcdir/$_pkgsrc"
    local -A _submodules=(
      ['flyinghead.mingw-breakpad']='core/deps/breakpad'
      ['google.oboe']='core/deps/oboe'
      ['gpuopen-librariesandsdks.vulkanmemoryallocator']='core/deps/VulkanMemoryAllocator'
      ['khronosgroup.glslang']='core/deps/glslang'
      ['khronosgroup.vulkan-headers']='core/deps/Vulkan-Headers'
      ['libsdl-org.sdl']='core/deps/SDL'
      ['rtissera.libchdr']='core/deps/libchdr'
      ['vinniefalco.luabridge']='core/deps/luabridge'
      ['vkedwardli.spout2']='core/deps/Spout'
      ['vkedwardli.syphon-framework']='core/deps/Syphon'
    )
    _submodule_update
  )
}

_source_vinniefalco_luabridge() {
  source+=(
    'google.googletest'::'git+https://github.com/google/googletest.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_vinniefalco_luabridge() (
    cd "$srcdir/$_pkgsrc"
    cd 'core/deps/luabridge'
    local -A _submodules=(
      ['google.googletest']='third_party/gtest'
    )
    _submodule_update
  )
}

# common functions
prepare() {
  _submodule_update() {
    local key;
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  apply-patch() {
    if patch -Np1 -F100 --dry-run -i "$1" &>/dev/null ; then
      printf '\nApplying patch: %s\n' "$1"
      patch -Np1 -F100 -i "$1"
    else
      printf '\nPatch already applied: %s\n' "$1"
    fi
  }

  _prepare_flycast
  #_prepare_vinniefalco_luabridge

  _prepare

  cd "$_pkgsrc"
  apply-patch "$srcdir/breakpad-disable.patch"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_BUILD_TYPE=Release
    -Wno-dev
  )

  if [[ "${_build_clang::1}" == "t" ]] ; then
    export CC=clang
    export CXX=clang++
    export LDFLAGS+=" -fuse-ld=lld"
  fi

  if [[ "${_build_avx::1}" == "t" ]] ; then
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

# update version
_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi

  local _response=$(curl -Ssf "$url/releases.atom")
  local _tag=$(
    printf '%s' "$_response" \
      | grep '/releases/tag/' \
      | sed -E 's@^.*/releases/tag/(.*)".*$@\1@' \
      | grep -Ev '[a-z]{2}' | sort -V | tail -1
  )
  local _pkgver_new="${_tag#v}"

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="$_pkgver_new"
  fi
}

# execute
_main_package
