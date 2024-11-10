# Maintainer:

## useful commands
# LLVM_PROFILE_FILE="default_%9m.profraw" pcsx2-qt
# llvm-profdata merge -output=pcsx2-avx-git.profdata *.profraw

## options
: ${_commit:=2d5faa627ff54f3fb2a69a43286181bee071a1c3} # 2.2.0
: ${_install_path:=opt}

: ${_build_instrumented:=false}
: ${_build_pgo:=try}

: ${_build_avx:=true}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_instrumented::1}" == "t" ]] && _pkgtype+="-instrumented"
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="pcsx2"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.3.1.r59.g73549038
pkgrel=1
pkgdesc='Sony PlayStation 2 emulator'
url="https://github.com/PCSX2/pcsx2"
license=('GPL-3.0-or-later')
arch=('x86_64')

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
  clang
  lld
  llvm

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

if [ "${_build_git::1}" == "t" ]; then
  provides=("$_pkgname")
  conflicts=("$_pkgname")
  _commit="master"

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

options=('!debug' 'lto')
install="$_pkgname.install"

_source_pcsx2() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#commit=$_commit")
  sha256sums+=('SKIP')
}

_source_pcsx2_patches() {
  source+=("pcsx2_patches"::"git+https://github.com/PCSX2/pcsx2_patches.git")
  sha256sums+=('SKIP')
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
}

_prepare_pcsx2() (
  cd "$_pkgsrc"

  # rename patched shaderc
  sed -E -e 's&"shaderc_shared"&"'"shaderc_$_pkgname"'"&' -i "pcsx2/GS/Renderers/Vulkan/VKShaderCache.cpp"

  # prevent march=native
  sed -E -e 's@^(\s*)(add_compile_options\(.*march=native.*\))@\1message("skip: march=native")@' \
    -i "cmake/BuildParameters.cmake"
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

_source_pcsx2
_source_pcsx2_patches
_source_shaderc

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
}

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

_build_pcsx2() {
  echo "Building pcsx2..."
  local _cmake_pcsx2

  _cmake_pcsx2+=(
    -S "$_pkgsrc"
    -B build_pcsx2
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_SKIP_RPATH=ON
    -DSHADERC_INCLUDE_DIR="$srcdir/deps/usr/include"
    -DSHADERC_LIBRARY="$srcdir/deps/usr/lib/libshaderc_shared.so.1"
    -DUSE_ASAN=OFF
    -DUSE_BACKTRACE=OFF
    -DENABLE_TESTS=OFF
    -Wno-dev
  )

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

_build_pcsx2_patches() (
  cd pcsx2_patches
  7z a -mx=9 -r ../patches.zip patches/.
)

build() {
  export CC CXX CFLAGS CXXFLAGS LDFLAGS
  CC=clang
  CXX=clang++
  LDFLAGS="${LDFLAGS//*fuse-ld*/} -fuse-ld=lld"

  if [[ "${_build_avx::1}" == "t" ]]; then
    CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi

  _build_shaderc
  _build_pcsx2
  _build_pcsx2_patches
}

package() {
  install -Dm644 patches.zip -t "$pkgdir/$_install_path/$_pkgname/resources/"
  cp --reflink=auto -r build_pcsx2/bin/* "$pkgdir/$_install_path/$_pkgname/"

  # rpath
  patchelf --force-rpath --set-rpath "/$_install_path/$_pkgname" "$pkgdir/$_install_path/$_pkgname/$_pkgname-qt"

  # libraries
  local _shaderc_patched="$pkgdir/$_install_path/$_pkgname/libshaderc_$_pkgname.so.1"
  install -Dm644 "$srcdir/deps/usr/lib/libshaderc_shared.so.1" "$_shaderc_patched"
  patchelf --set-soname "libshaderc_$_pkgname.so.1" "$_shaderc_patched"

  # icon
  install -Dm644 "$_pkgsrc/bin/resources/icons/AppIconLarge.png" \
    "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec /$_install_path/$_pkgname/$_pkgname-qt "\$@"
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
