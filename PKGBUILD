# Maintainer:

## useful commands
# LLVM_PROFILE_FILE="default_%9m.profraw" pcsx2-qt
# llvm-profdata merge -output=pcsx2-avx-git.profdata *.profraw

## options
: ${_build_debug:=false}
: ${_build_pgo:=try}

: ${_build_git_tools:=false}

: ${_build_instrumented:=false}

: ${_build_avx:=true}
: ${_build_git:=true}

unset _tooltype # clang-git, llvm-git, lld-git, mold-git
[[ "${_build_git_tools::1}" == "t" ]] && _tooltype+="-git"

unset _pkgtype
[[ "${_build_instrumented::1}" == "t" ]] && _pkgtype+="-instrumented"
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="pcsx2"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=1.7.5944.r0.gd3bcfe0
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
    ## compiler
    "clang${_tooltype:-}"
    "lld${_tooltype:-}"
    "llvm${_tooltype:-}"

    ## build
    cmake
    extra-cmake-modules
    git
    ninja

    ## pcsx2
    libpipewire
    libpulse
    qt6-tools
    qt6-wayland

    p7zip

    ## fixups
    patchelf
  )
  optdepends=(
    'qt6-wayland: Wayland support'
  )

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  if [[ "${_build_debug::1}" == "t" ]]; then
    options=(debug !lto)
  else
    options=(!debug lto)
  fi

  install="$_pkgname.install"

  source=()
  sha256sums=()

  _source_pcsx2
  _source_backtrace
  _source_shaderc
}

_source_pcsx2() {
  _pkgsrc="$_pkgname"
  source+=(
    "$_pkgsrc"::"git+$url.git"
    "pcsx2_patches"::"git+https://github.com/PCSX2/pcsx2_patches.git"
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )

  _prepare_pcsx2() (
    cd "$_pkgsrc"
    sed -E -e 's&"shaderc_shared"&"'"shaderc_$_pkgname"'"&' -i "pcsx2/GS/Renderers/Vulkan/VKShaderCache.cpp"
  )
}

_source_backtrace() {
  source+=(
    "ianlancetaylor.libbacktrace"::"git+https://github.com/ianlancetaylor/libbacktrace.git"
  )
  sha256sums+=(
    'SKIP'
  )

  _build_backtrace() (
    echo "Building libbacktrace..."
    cd "ianlancetaylor.libbacktrace"

    autoreconf -fi
    ./configure
    make

    install -Dm644 .libs/libbacktrace.a -t "$srcdir/deps/"
    install -Dm644 *.h -t "$srcdir/deps/include/"
  )
}

_source_shaderc() {
  depends+=(
    'glslang'
    'spirv-tools'
  )
  makedepends+=(
    'patchutils'
    'spirv-headers'
  )

  source+=(
    "google.shaderc"::"git+https://github.com/google/shaderc.git"
    #"khronosgroup.glslang"::"git+https://github.com/KhronosGroup/glslang.git"
    #"khronosgroup.spirv-headers"::"git+https://github.com/KhronosGroup/SPIRV-Headers.git"
    #"khronosgroup.spirv-tools"::"git+https://github.com/KhronosGroup/SPIRV-Tools.git"
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_shaderc() (
    local _version_shaderc=$(grep -E -m1 'SHADERC=' "$_pkgsrc/.github/workflows/scripts/linux/build-dependencies-qt.sh" | sed -E -e 's&^\s*SHADERC=(\S+)$&\1&')

    git -C "$srcdir/google.shaderc" checkout -f "v$_version_shaderc"

    filterdiff -x '*/CMakeLists.txt' "$srcdir/$_pkgsrc/.github/workflows/scripts/common/shaderc-changes.patch" \
      | sed -E 's&non_sematic_debug_info&non_semantic_debug_info&' \
        > shaderc-changes.patch

    cd "$srcdir/google.shaderc"
    git apply "$srcdir/shaderc-changes.patch"

    sed -E -e '/\(glslc\)/d;/examples/d;/third_party/d' \
      -i CMakeLists.txt
  )

  _build_shaderc() {
    echo "Building shaderc..."
    local _cmake_shaderc=(
      -B build_shaderc
      -S google.shaderc
      -G Ninja
      -DCMAKE_BUILD_TYPE=None
      -DCMAKE_INSTALL_PREFIX=/usr
      -DSHADERC_SKIP_TESTS=ON
      -DSHADERC_SKIP_EXAMPLES=ON
      -DSHADERC_SKIP_COPYRIGHT_CHECK=ON
      -Dglslang_SOURCE_DIR=/usr/include/glslang
      -Wno-dev
    )

    cmake "${_cmake_shaderc[@]}"
    cmake --build build_shaderc
    DESTDIR="$srcdir/deps" cmake --install build_shaderc
  }
}

_build_pcsx2() {
  echo "Building pcsx2..."
  local _cmake_pcsx2

  _cmake_pcsx2+=(
    -S "$_pkgsrc"
    -B build_pcsx2
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_SKIP_RPATH=ON
    -DLIBBACKTRACE_INCLUDE_DIR="$srcdir/deps/include"
    -DLIBBACKTRACE_LIBRARY="$srcdir/deps/libbacktrace.a"
    -DSHADERC_INCLUDE_DIR="$srcdir/deps/usr/include"
    -DSHADERC_LIBRARY="$srcdir/deps/usr/lib/libshaderc_shared.so.1"
  )

  if [[ "${_build_debug::1}" == "t" ]]; then
    _cmake_pcsx2+=(
      -DENABLE_TESTS=ON
      -DUSE_ASAN=ON
    )
  else
    _cmake_pcsx2+=(
      -DENABLE_TESTS=OFF
      -DUSE_ASAN=OFF
      -Wno-dev
    )
  fi

  if [[ "${_build_avx::1}" == "t" ]]; then
    _cmake_pcsx2+=(-DDISABLE_ADVANCE_SIMD=OFF)
  else
    _cmake_pcsx2+=(-DDISABLE_ADVANCE_SIMD=ON)
  fi

  local _pgo_profile_old="${SRCDEST:-$startdir}/$pkgname.profdata"
  local _pgo_profile="$srcdir/$pkgname.profdata"
  if [[ "${_build_instrumented::1}" == "t" ]]; then
    echo "Compiling with instrumentation."
    CFLAGS+=" -fprofile-generate"
    CXXFLAGS+=" -fprofile-generate"
  elif [[ "${_build_pgo::1}" == "t" ]] && [ -e "$_pgo_profile_old" ]; then
    echo "Compiling with profile-guided optimization."
    cp --reflink=auto "$_pgo_profile_old" "$_pgo_profile"

    CFLAGS+=" -fprofile-use='$_pgo_profile'"
    CXXFLAGS+=" -fprofile-use='$_pgo_profile'"
  else
    echo "Compiling with standard optimization."
  fi

  cmake "${_cmake_pcsx2[@]}"
  cmake --build build_pcsx2
}

# common functions
prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _prepare_pcsx2
  _prepare_shaderc

  # prevent march=native
  sed -E -e 's@^(\s*)(add_compile_options\(.*march=native.*\))@\1message("skip: march=native")@' \
    -i "$_pkgsrc/cmake/BuildParameters.cmake"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export AR CC CXX CFLAGS CXXFLAGS LDFLAGS
  AR=llvm-ar
  CC=clang
  CXX=clang++
  LDFLAGS="$(echo "$LDFLAGS" | sed -E 's@\s*-(fuse-ld)=\S+\s*@ @g;s@\s+@ @g') -fuse-ld=lld"

  if [[ "${_build_avx::1}" == "t" ]]; then
    CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi

  _build_backtrace
  _build_shaderc
  _build_pcsx2

  cd pcsx2_patches
  7z a -mx=9 -r ../patches.zip patches/.
}

package() {
  install -Dm644 patches.zip -t "$pkgdir/opt/$_pkgname/resources/"
  cp --reflink=auto -r build_pcsx2/bin/* "$pkgdir/opt/$_pkgname/"

  # rpath
  patchelf --force-rpath --set-rpath "/opt/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname-qt"

  # libraries
  local _shaderc_patched="$pkgdir/opt/$_pkgname/libshaderc_$_pkgname.so.1"
  install -Dm644 "$srcdir/deps/usr/lib/libshaderc_shared.so.1" "$_shaderc_patched"
  patchelf --set-soname "libshaderc_$_pkgname.so.1" "$_shaderc_patched"

  # icon
  install -Dm644 "$_pkgsrc/bin/resources/icons/AppIconLarge.png" \
    "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec /opt/$_pkgname/$_pkgname-qt "\$@"
END

  # launcher
  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=PCSX2
GenericName=PlayStation 2 Emulator
Comment=Sony PlayStation 2 emulator
Icon=$_pkgname
TryExec=$_pkgname
Exec=$_pkgname %f
Terminal=false
StartupNotify=true
Categories=Game;Emulator;Qt
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

# execute
_main_package
