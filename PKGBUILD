# Maintainer:

## useful links
# https://github.com/stenzek/duckstation/tags

## options
: ${_build_avx:=false}
: ${_build_git:=false}

unset _pkgtype
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="duckstation"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.1.6892
pkgrel=1
pkgdesc="Playstation emulator"
url="https://github.com/stenzek/duckstation"
arch=('x86_64')
license=('GPL-3.0-only')

depends=(
  ## duckstation
  'libwebp'
  'libxrandr'
  'qt6-base'
  'sdl2'

  ## shaderc
  'glslang'
  'spirv-tools'

  ## implicit
  #curl
  #dbus
  #freetype2
  #libjpeg.so
  #libpng
  #libx11
  #systemd-libs
  #zlib
  #zstd

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

_src_shaderc="google.shaderc"
_src_backtrace="ianlancetaylor.libbacktrace"

source=(
  "$_src_shaderc"::"git+https://github.com/google/shaderc.git"
  "$_src_backtrace"::"git+https://github.com/ianlancetaylor/libbacktrace.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

if [ "${_build_git::1}" != "t" ]; then
  _commit='f1ff15f9c603be8363d2c50cfdb9c7da11d61bea'

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#commit=$_commit")
  sha256sums+=('SKIP')

  _pkgver() {
    cd "$_pkgsrc"
    git describe --tag | sed -E 's/^[^0-9]*//;s/-/./g'
  }
else
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    local _tag=$(git tag | sed -E '/^.*[A-Za-z]{2}.*$/d' | sort -rV | head -1)
    local _pkgver=$(sed -E 's/^[^0-9]*//;s/-/./g' <<< "$_tag")
    local _revision=$(git rev-list --count --cherry-pick $_tag...HEAD)
    local _commit=$(git rev-parse --short=7 HEAD)

    printf "%s.r%s.g%s" "${_pkgver:?}" "${_revision:?}" "${_commit:?}"
  }
fi

_prepare_shaderc() (
  local _version_shaderc=$(grep -E -m1 'SHADERC=' "$_pkgsrc/scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*SHADERC=(\S+)$&\1&')

  git -C "$srcdir/$_src_shaderc" checkout -f "v$_version_shaderc"

  filterdiff -x '*/CMakeLists.txt' "$srcdir/$_pkgsrc/.github/workflows/scripts/common/shaderc-changes.patch" \
    | sed -E 's&non_sematic_debug_info&non_semantic_debug_info&' \
      > shaderc-changes.patch

  cd "$_src_shaderc"
  git apply "$srcdir/$_pkgname/scripts/shaderc-changes.patch"

  sed -E -e '/\(glslc\)/d;/examples/d;/third_party/d' \
    -i CMakeLists.txt
)

prepare() {
  _prepare_shaderc

  sed -E -e 's&"shaderc_shared"&"'"shaderc_$_pkgname"'"&' -i "$_pkgsrc/src/util/gpu_device.cpp"
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
    -DSHADERC_LIBRARY="$srcdir/deps/usr/lib/libshaderc_shared.so.1"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

build() {
  export AR CC CXX CFLAGS CXXFLAGS LDFLAGS
  AR="llvm-ar"
  CC="clang"
  CXX="clang++"
  LDFLAGS+=" -fuse-ld=lld"

  if [[ "${_build_avx::1}" == "t" ]]; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi

  _build_libbacktrace
  _build_shaderc
  _build_duckstation
}

package() {
  install -dm755 "$pkgdir/opt/$_pkgname/"
  cp --reflink=auto -r build/bin/{resources,translations,duckstation-qt} "$pkgdir/opt/$_pkgname/"

  # rpath
  patchelf --force-rpath --set-rpath "/opt/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname-qt"

  # libraries
  local _shaderc_patched="$pkgdir/opt/$_pkgname/libshaderc_$_pkgname.so.1"
  install -Dm644 "$srcdir/deps/usr/lib/libshaderc_shared.so.1" "$_shaderc_patched"
  patchelf --set-soname "libshaderc_patched.so.1" "$_shaderc_patched"

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
