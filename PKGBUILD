# Maintainer:

## useful commands
# LLVM_PROFILE_FILE="default_%9m.profraw" pcsx2-qt
# llvm-profdata merge -output=pcsx2-avx-git.profdata *.profraw

## options
: ${_build_debug:=false}
: ${_build_pgo:=try}

: ${_build_clang:=true}
: ${_build_mold:=false}

: ${_build_instrumented:=false}

: ${_build_avx:=true}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_instrumented::1}" == "t" ]] && _pkgtype+="-instrumented"
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="pcsx2"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=1.7.5586.r0.gb9a7143d
pkgrel=1
pkgdesc='Sony PlayStation 2 emulator'
url="https://github.com/PCSX2/pcsx2"
license=('GPL-3.0-only' 'LGPL-3.0-only')
arch=('x86_64')

# main package
_main_package() {
  depends=(
    alsa-lib
    ffmpeg
    libaio
    libglvnd
    libpcap
    libpng
    libxrandr
    qt6-base
    qt6-svg
    sdl2
    soundtouch
    wayland
    xcb-util-cursor
  )
  makedepends=(
    cmake
    extra-cmake-modules
    gendesk
    git
    libpipewire
    libpulse
    ninja
    p7zip
    qt6-tools
    qt6-wayland
  )
  optdepends=(
    'qt6-wayland: Wayland support'
  )

  if [[ "${_build_clang::1}" == "t" ]] ; then
    makedepends+=(
      clang
      llvm
      lld
    )
  fi

  if [[ "${_build_mold::1}" == "t" ]] ; then
    makedepends+=('mold')
  fi

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  install="$_pkgname.install"

  if [[ "${_build_debug::1}" == "t" ]] ; then
    options=(
      'debug'
      '!lto'
    )
  else
    options=(
      '!debug'
      'lto'
    )
  fi

  _pkgsrc="$_pkgname"
  source+=(
    "$_pkgsrc"::"git+$url.git"
    "pcsx2_patches"::"git+https://github.com/PCSX2/pcsx2_patches.git"
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )

  _source_pcsx2

  _source_biojppm_rapidyaml
  _source_biojppm_c4core
}

# submodules
_source_pcsx2() {
  source+=(
    'biojppm.rapidyaml'::'git+https://github.com/biojppm/rapidyaml.git'
    'facebook.zstd'::'git+https://github.com/facebook/zstd.git'
    'fmtlib.fmt'::'git+https://github.com/fmtlib/fmt.git'
    'google.googletest'::'git+https://github.com/google/googletest.git'
    'khronosgroup.glslang'::'git+https://github.com/KhronosGroup/glslang.git'
    'khronosgroup.vulkan-headers'::'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
    'lz4'::'git+https://github.com/lz4/lz4.git'
    'microsoft.wil'::'git+https://github.com/microsoft/wil.git'
    'tukaani-project.xz'::'git+https://github.com/tukaani-project/xz.git'
    'webmproject.libwebp'::'git+https://github.com/webmproject/libwebp.git'
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

  _prepare_pcsx2() (
    cd "$_pkgsrc"
    local -A _submodules=(
      ['biojppm.rapidyaml']='3rdparty/rapidyaml/rapidyaml'
      ['facebook.zstd']='3rdparty/zstd/zstd'
      ['fmtlib.fmt']='3rdparty/fmt/fmt'
      ['google.googletest']='3rdparty/gtest'
      ['khronosgroup.glslang']='3rdparty/glslang/glslang'
      ['khronosgroup.vulkan-headers']='3rdparty/vulkan-headers'
      ['lz4']='3rdparty/lz4/lz4'
      ['microsoft.wil']='3rdparty/wil'
      ['tukaani-project.xz']='3rdparty/xz/xz'
      ['webmproject.libwebp']='3rdparty/libwebp/libwebp'
    )
    _submodule_update
  )
}

_source_biojppm_rapidyaml() {
  source+=(
    'biojppm.c4core'::'git+https://github.com/biojppm/c4core.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_biojppm_rapidyaml() (
    cd "$_pkgsrc"
    cd '3rdparty/rapidyaml/rapidyaml'
    local -A _submodules=(
      ['biojppm.c4core']='ext/c4core'
    )
    _submodule_update
  )
}

_source_biojppm_c4core() {
  source+=(
    'biojppm.debugbreak'::'git+https://github.com/biojppm/debugbreak.git'
    'biojppm.cmake'::'git+https://github.com/biojppm/cmake.git'
    'fastfloat.fast_float'::'git+https://github.com/fastfloat/fast_float.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_biojppm_c4core() (
    cd "$_pkgsrc"
    cd '3rdparty/rapidyaml/rapidyaml'
    cd 'ext/c4core'
    local -A _submodules=(
      ['biojppm.debugbreak']='src/c4/ext/debugbreak'
      ['biojppm.cmake']='cmake'
      ['fastfloat.fast_float']='src/c4/ext/fast_float'
    )
    _submodule_update
  )
}

# common functions
prepare() {
  cat <<'EOF' > "$_pkgname.sh"
#!/usr/bin/env sh
exec /opt/pcsx2/pcsx2-qt "$@"
EOF

  local _gendesk_options=(
    -q -f -n
    --pkgname="$_pkgname"
    --pkgdesc="$pkgdesc"
    --name="PCSX2"
    --exec="/opt/pcsx2/pcsx2-qt"
    --icon="$_pkgname"
    --terminal=false
    --categories="Game;Emulator"
    --startupnotify=true
  )

  gendesk "${_gendesk_options[@]}"

  _submodule_update() {
    local key
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  _prepare_pcsx2

  _prepare_biojppm_rapidyaml
  _prepare_biojppm_c4core

  # prevent march=native
  sed -E -e 's@^(\s*)(add_compile_options\(.*march=native.*\))@\1message("skip: march=native")@' \
    -i "$_pkgsrc/cmake/BuildParameters.cmake"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options
  _cmake_options+=(
    -S "$_pkgsrc"
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE="Release"
  )

  if [[ "${_build_debug::1}" == "t" ]] ; then
    _cmake_options+=(
      -DENABLE_TESTS=ON
      -DUSE_ASAN=ON
    )
  else
    _cmake_options+=(
      -DENABLE_TESTS=OFF
      -DUSE_ASAN=OFF
      -Wno-dev
    )
  fi

  if [[ "${_build_clang::1}" == "t" ]] ; then
    export AR=llvm-ar
    export NM=llvm-nm
    export CC=clang
    export CXX=clang++
  fi

  if [[ "${_build_mold::1}" == "t" ]] ; then
    export LDFLAGS+=" -fuse-ld=mold"
  elif [[ "${_build_clang::1}" == "t" ]] ; then
    export LDFLAGS+=" -fuse-ld=lld"
  fi

  if [[ "${_build_avx::1}" == "t" ]] ; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"

    _cmake_options+=(-DDISABLE_ADVANCE_SIMD=OFF)
  else
    _cmake_options+=(-DDISABLE_ADVANCE_SIMD=ON)
  fi

  local _pgo_profile_old="${SRCDEST:-$startdir}/$pkgname.profdata"
  local _pgo_profile="$srcdir/$pkgname.profdata"
  if [[ "${_build_instrumented::1}" == "t" ]] ; then
    echo "Compiling with instrumentation."
    export CFLAGS+=" -fprofile-generate"
    export CXXFLAGS+=" -fprofile-generate"
  elif [[ "${_build_pgo::1}" == "t" ]] && [ -e "$_pgo_profile_old" ] ; then
    echo "Compiling with profile-guided optimization."
    cp --reflink=auto "$_pgo_profile_old" "$_pgo_profile"

    export CFLAGS+=" -fprofile-use='$_pgo_profile'"
    export CXXFLAGS+=" -fprofile-use='$_pgo_profile'"
  else
    echo "Compiling with standard optimization."
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build

  cd pcsx2_patches
  7z a -mx=9 -r ../patches.zip patches/.
}

package() {
  install -Dm644 patches.zip -t "$pkgdir/opt/$_pkgname/resources/"
  cp --reflink=auto -r build/bin/* "$pkgdir/opt/$_pkgname/"

  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/pcsx2-qt"

  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/pcsx2-qt.desktop"

  install -Dm644 "$_pkgsrc/bin/resources/icons/AppIconLarge.png" \
    "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}

# execute
_main_package
