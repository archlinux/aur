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
  'glslang'
  'libwebp'
  'libxrandr'
  'qt6-base'
  'sdl2'
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

  ## AUR
  'libbacktrace'
)
makedepends=(
  'clang'
  'cmake'
  'extra-cmake-modules'
  'git'
  'lld'
  'llvm'
  'ninja'
  'python'
  'qt6-tools'
  'qt6-wayland'
  'spirv-headers'
)

source=("google.shaderc"::"git+https://github.com/google/shaderc.git")
sha256sums=('SKIP')

if [ "${_build_git::1}" != "t" ]; then
  _commit=26917f14c568a8133721bb21614c08bd6fe1efce

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

prepare() {
  cd "google.shaderc"
  # apply duckstation patch
  git apply "$srcdir/$_pkgname/scripts/shaderc-changes.patch"

  # de-vendor libs and disable git versioning
  sed '/examples/d;/third_party/d' -i CMakeLists.txt
  sed '/build-version/d' -i glslc/CMakeLists.txt
  cat <<- EOF > glslc/src/build-version.inc
"${pkgver}\\n"
"$(pacman -Q spirv-tools | cut -d \  -f 2 | sed 's/-.*//')\\n"
"$(pacman -Q glslang | cut -d \  -f 2 | sed 's/-.*//')\\n"
EOF
}

build() {
  export CC CXX CFLAGS CXXFLAGS LDFLAGS LTOFLAGS
  CC="clang"
  CXX="clang++"
  LDFLAGS+=" -fuse-ld=lld"
  LTOFLAGS="-flto=thin"

  if [[ "${_build_avx::1}" == "t" ]]; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi

  echo "Building shaderc..."

  local _cmake_shaderc=(
    -B build_shaderc
    -S "google.shaderc"
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

  echo "Building duckstation..."

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_NOGUI_FRONTEND=OFF
    -DBUILD_QT_FRONTEND=ON
    -DCMAKE_PREFIX_PATH="$srcdir/deps/usr"
    -DCMAKE_SKIP_RPATH=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  install -dm755 "$pkgdir/opt/$_pkgname/"
  cp --reflink=auto -r build/bin/{resources,translations,duckstation-qt} "$pkgdir/opt/$_pkgname/"

  # bundled shaderc
  install -Dm644 "$srcdir/deps/usr/lib/libshaderc_shared.so.1" -t "$pkgdir/opt/$_pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/duckstation" << END
#!/usr/bin/env bash
exec /opt/$_pkgname/duckstation-qt "\$@"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/duckstation.desktop" << END
[Desktop Entry]
Type=Application
Name=DuckStation
GenericName=PlayStation Emulator
Comment=PlayStation emulator
Icon=duckstation
TryExec=duckstation
Exec=duckstation %f
Categories=Game;Emulator;Qt;
END

  install -dm755 "$pkgdir/usr/share/pixmaps/"
  ln -sf "$pkgdir/opt/$_pkgname/resources/images/duck.png" "$pkgdir/usr/share/pixmaps/duckstation.png"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
