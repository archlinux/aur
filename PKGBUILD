# Maintainer:

## useful links
# https://github.com/stenzek/duckstation/tags

## options
: ${_build_avx:=false}
: ${_build_git:=false}

: ${_commit:=d45e218da7ae28b21a3b8ca32a1b7fe31986138f}

unset _pkgtype
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="duckstation"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.1.6937
pkgrel=1
pkgdesc="Playstation emulator"
url="https://github.com/stenzek/duckstation"
arch=('x86_64')
license=('GPL-3.0-only')

_main_package() {
  depends=(
    ## duckstation
    'libwebp'
    'libxrandr'
    'qt6-base'
    'sdl2'

    ## shaderc
    'glslang'
    'spirv-tools'
  )
  makedepends=(
    ## compiler
    'clang'
    'lld'
    'llvm'

    ## build
    'cmake'
    'extra-cmake-modules'
    'git'
    'ninja'

    ## duckstation
    'qt6-tools'
    'qt6-wayland'

    ## shaderc
    'spirv-headers'

    ## fixups
    'patchelf'
    'patchutils'
  )

  if [ "${_build_git::1}" != "t" ]; then
    _source_duckstation
  else
    _source_duckstation_git
  fi

  _src_backtrace="ianlancetaylor.libbacktrace"
  _src_shaderc="google.shaderc"
  _src_spirv_cross="khronosgroup.spirv-cross"
  source+=(
    "$_src_shaderc"::"git+https://github.com/google/shaderc.git"
    "$_src_backtrace"::"git+https://github.com/ianlancetaylor/libbacktrace.git"
    "$_src_spirv_cross"::"git+https://github.com/KhronosGroup/SPIRV-Cross.git"
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
    'SKIP'
  )
}

_source_duckstation() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
  sha256sums=('SKIP')

  _pkgver() {
    cd "$_pkgsrc"
    git describe --tag | sed -E 's/^[^0-9]*//;s/-/./g'
  }
}

_source_duckstation_git() {
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    local _tag=$(git tag | sed -E '/^.*[A-Za-z]{2}.*$/d' | sort -rV | head -1)
    local _pkgver=$(sed -E 's/^[^0-9]*//;s/-/./g' <<< "$_tag")
    local _revision=$(git rev-list --count --cherry-pick $_tag...HEAD)
    local _commit=$(git rev-parse --short=7 HEAD)

    printf "%s.r%s.g%s" "${_pkgver:?}" "${_revision:?}" "${_commit:?}"
  }
}

_prepare_duckstation() {
  sed -E -e 's&"shaderc_shared"&"'"shaderc-$_pkgname"'"&' \
    -e 's&"spirv-cross-c-shared"&"'"spirv-cross-c-$_pkgname"'"&' \
    -i "$_pkgsrc/src/util/gpu_device.cpp"
}

_prepare_shaderc() (
  local _version_shaderc=$(grep -E -m1 'SHADERC=' "$_pkgsrc/scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*SHADERC=(\S+)$&\1&')

  git -C "$srcdir/$_src_shaderc" checkout -f "v$_version_shaderc"

  filterdiff "$srcdir/$_pkgsrc/scripts/shaderc-changes.patch" \
    | sed -E 's&non_sematic_debug_info&non_semantic_debug_info&' \
      > shaderc-changes.patch

  cd "$_src_shaderc"
  git apply "$srcdir/shaderc-changes.patch"

  sed -E -e '/\(glslc\)/d;/examples/d;/third_party/d' \
    -i CMakeLists.txt
)

_prepare_spirv_cross() (
  local _version_spirv_cross=$(grep -E -m1 'SPIRV_CROSS=' "$_pkgsrc/scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*SPIRV_CROSS=(\S+)$&\1&')

  git -C "$srcdir/$_src_spirv_cross" checkout -f "$_version_spirv_cross"

  filterdiff "$srcdir/$_pkgsrc/scripts/spirv-cross-changes.patch" \
    > spirv-cross-changes.patch

  cd "$_src_spirv_cross"
  git apply "$srcdir/spirv-cross-changes.patch"
)

prepare() {
  _prepare_shaderc
  _prepare_spirv_cross
  _prepare_duckstation
}

_build_libbacktrace() (
  echo "Building libbacktrace..."
  cd "$_src_backtrace"

  autoreconf -fi
  ./configure
  make

  install -Dm644 .libs/libbacktrace.a -t "$srcdir/deps/"
  install -Dm644 *.h -t "$srcdir/deps/include/"
)

_build_shaderc() {
  echo "Building shaderc..."

  local _cmake_shaderc=(
    -B build_shaderc
    -S "$_src_shaderc"
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

_build_spirv_cross() {
  echo "Building spirv-cross..."

  local _cmake_spirv_cross=(
    -B build_spirv_cross
    -S "$_src_spirv_cross"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DSPIRV_CROSS_SHARED=ON
    -DSPIRV_CROSS_STATIC=OFF
    -DSPIRV_CROSS_CLI=OFF
    -DSPIRV_CROSS_ENABLE_TESTS=OFF
    -DSPIRV_CROSS_ENABLE_GLSL=ON
    -DSPIRV_CROSS_ENABLE_HLSL=OFF
    -DSPIRV_CROSS_ENABLE_MSL=OFF
    -DSPIRV_CROSS_ENABLE_CPP=OFF
    -DSPIRV_CROSS_ENABLE_REFLECT=OFF
    -DSPIRV_CROSS_ENABLE_C_API=ON
    -DSPIRV_CROSS_ENABLE_UTIL=ON
    -Wno-dev
  )

  cmake "${_cmake_spirv_cross[@]}"
  cmake --build build_spirv_cross
  DESTDIR="$srcdir/deps" cmake --install build_spirv_cross
}

_build_duckstation() {
  echo "Building duckstation..."

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_NOGUI_FRONTEND=OFF
    -DBUILD_QT_FRONTEND=ON

    -DCMAKE_SKIP_RPATH=ON
    -DLIBBACKTRACE_LIBRARY="$srcdir/deps/libbacktrace.a"
    -DLIBBACKTRACE_INCLUDE_DIR="$srcdir/deps/include"
    -DSHADERC_INCLUDE_DIR="$srcdir/deps/usr/include"
    -DSHADERC_LIBRARY="$srcdir/deps/usr/lib/libshaderc_shared.so"
    -Dspirv_cross_c_shared_DIR="$srcdir/deps/usr/share/spirv_cross_c_shared/cmake"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

_build_env() {
  export AR CC CXX CFLAGS CXXFLAGS LDFLAGS
  AR="llvm-ar"
  CC="clang"
  CXX="clang++"
  LDFLAGS+=" -fuse-ld=lld"

  if [[ "${_build_avx::1}" == "t" ]]; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi
}

build() {
  _build_env

  _build_libbacktrace
  _build_shaderc
  _build_spirv_cross
  _build_duckstation
}

package() {
  install -dm755 "$pkgdir/opt/$_pkgname/"
  cp --reflink=auto -r build/bin/{resources,translations,duckstation-qt} "$pkgdir/opt/$_pkgname/"

  # rpath
  patchelf --force-rpath --set-rpath "/opt/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname-qt"

  # libraries
  ls -l "$srcdir/deps/usr/lib/"

  local _shaderc_patched="$pkgdir/opt/$_pkgname/libshaderc-$_pkgname.so"
  cp -L "$srcdir/deps/usr/lib/libshaderc_shared.so" "$_shaderc_patched"
  patchelf --set-soname "${_shaderc_patched##*/}" "$_shaderc_patched"

  local _spirv_cross_patched="$pkgdir/opt/$_pkgname/libspirv-cross-c-$_pkgname.so"
  install -Dm644 "$srcdir/deps/usr/lib/libspirv-cross-c-shared.so" "$_spirv_cross_patched"
  patchelf --set-soname "${_spirv_cross_patched##*/}" "$_spirv_cross_patched"

  # icon
  install -Dm644 "$pkgdir/opt/$_pkgname/resources/images/duck.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec /opt/$_pkgname/$_pkgname-qt "\$@"
END

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=DuckStation
GenericName=PlayStation Emulator
Comment=PlayStation emulator
Icon=$_pkgname
TryExec=$_pkgname
Exec=$_pkgname %f
Terminal=false
StartupNotify=true
Categories=Game;Emulator;Qt;
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

# execute
_main_package
