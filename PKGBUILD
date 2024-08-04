# Maintainer:

_pkgname="replay-sorcery"
pkgname="$_pkgname"
pkgver=0.6.0
pkgrel=2
pkgdesc='Open-source, instant-replay solution for Linux'
url='https://github.com/matanui159/ReplaySorcery'
license=(GPL-3.0-or-later)
arch=('x86_64' 'i686')

depends=(
  'ffmpeg4.4'
  'gcc-libs'
  'libdrm'
  'libpulse'
  'libx11'
)
makedepends=(
  'cmake'
  'git'
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git#tag=$pkgver"
  'libbacktrace'::'git+https://github.com/ianlancetaylor/libbacktrace.git'
  '0000-include-avutil-ch-layout.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '5404e7d26db1eb8e051844d65c2182f9dfac813243d093ea8e4c4ae97bc548da'
)

prepare() {
  cd "$_pkgsrc"

  # submodules for replay-sorcery
  local _submodules=(
    'libbacktrace'::'dep/libbacktrace'
  )
  local _module
  for _module in "${_submodules[@]}"; do
    git submodule init "${_module##*::}"
    git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
    git -c protocol.file.allow=always submodule update "${_module##*::}"
  done

  # apply patches
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
