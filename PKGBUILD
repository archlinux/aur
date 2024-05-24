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
pkgver=0.1.6720
pkgrel=1
pkgdesc="Playstation emulator"
url="https://github.com/stenzek/duckstation"
arch=('x86_64')
license=('GPL-3.0-only')

depends=(
  'libwebp'
  'libxrandr'
  'qt6-base'
  'sdl2'
  'shaderc'

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
  'clang'
  'cmake'
  'extra-cmake-modules'
  'git'
  'llvm'
  'mold'
  'ninja'
  'qt6-tools'
)

if [ "${_build_git::1}" != "t" ]; then
  _commit=26917f14c568a8133721bb21614c08bd6fe1efce

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#commit=$_commit")
  sha256sums+=('SKIP')

  _pkgver() {
    cd "$_pkgsrc"
    git describe --tag | sed -E 's/^[^0-9]*//;s/-/./g'
  }

  _prepare() {
    # remove shaderc semantic debug
    sed -e '/vk_khr_shader_non_semantic_info/d' \
      -e '/SetEmitNonSemanticDebugInfo/d' \
      -i "$_pkgsrc/src/util/vulkan_pipeline.cpp"
  }
else
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _commit=0e2204e9289e5173ef7bb0f793575110a709a79e

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#commit=_commit")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    local _tag=$(git tag | sed -E '/^.*[A-Za-z]{2}.*$/d' | sort -rV | head -1)
    local _pkgver=$(sed -E 's/^[^0-9]*//;s/-/./g' <<< "$_tag")
    local _revision=$(git rev-list --count --cherry-pick $_tag...HEAD)
    local _commit=$(git rev-parse --short=7 HEAD)

    printf "%s.r%s.g%s" "${_pkgver:?}" "${_revision:?}" "${_commit:?}"
  }

  _prepare() {
    # remove shaderc semantic debug
    sed -e '/shaderc_compile_options_set_emit_non_semantic_debug_info/d' \
      -i "$_pkgsrc/src/util/gpu_device.cpp"
  }
fi

prepare() {
  _prepare
}

build() {
  export CC CXX CFLAGS CXXFLAGS LDFLAGS LTOFLAGS
  CC="clang"
  CXX="clang++"
  LDFLAGS+=" -fuse-ld=mold"
  LTOFLAGS="-flto=thin"

  if [[ "${_build_avx::1}" == "t" ]]; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_NOGUI_FRONTEND=OFF
    -DBUILD_QT_FRONTEND=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  install -dm755 "$pkgdir/opt/$_pkgname/"
  cp --reflink=auto -r build/bin/{resources,translations,duckstation-qt} "$pkgdir/opt/$_pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/duckstation-qt" << END
#!/usr/bin/env bash
exec /opt/$_pkgname/duckstation-qt "\$@"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/duckstation-qt.desktop" << END
[Desktop Entry]
Type=Application
Name=DuckStation
GenericName=PlayStation Emulator
Comment=PlayStation emulator
Icon=duckstation-qt
TryExec=duckstation-qt
Exec=duckstation-qt %f
Categories=Game;Emulator;Qt;
END

  install -dm755 "$pkgdir/usr/share/pixmaps/"
  ln -sf "$pkgdir/opt/$_pkgname/resources/images/duck.png" "$pkgdir/usr/share/pixmaps/duckstation-qt.png"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
