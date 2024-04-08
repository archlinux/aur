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
pkgver=0.1.6461
pkgrel=1
_pkgdesc="Playstation emulator"
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

if [ "${_build_git::1}" != "t" ] ; then
  _commit=359678a1678137f584760991dd4d45574fdbae12

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

build() {
  export CC CXX CFLAGS CXXFLAGS LDFLAGS LTOFLAGS
  CC="clang"
  CXX="clang++"
  LDFLAGS+=" -fuse-ld=mold"
  LTOFLAGS="-flto=thin"

  if [[ "${_build_avx::1}" == "t" ]] ; then
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

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/duckstation-qt" <<END
#!/usr/bin/env bash
exec /opt/$_pkgname/duckstation-qt "\$@"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/duckstation-qt.desktop" <<END
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
  ln "$pkgdir/opt/$_pkgname/resources/images/duck.png" "$pkgdir/usr/share/pixmaps/duckstation-qt.png"

  chmod -R u=rwX,go=rX "$pkgdir/"
}
