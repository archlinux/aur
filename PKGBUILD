# Maintainer:

## options
# check downstream project(s) before updating to Qt6
: ${_qt_version:=5}

_pkgname="maplibre-native"
pkgname="$_pkgname-git"
pkgver=3.0.0.r20.g10c6d82
pkgrel=1
pkgdesc="C++ library that powers customizable vector maps in native applications"
url="https://github.com/maplibre/maplibre-native-qt"
arch=("x86_64" "aarch64")
license=(
  # core library
  'BSD-2-Clause'

  ## QML bindings (pick one)
  #'GPL-2.0-only'
  #'GPL-3.0-only'
  'LGPL-3.0-only'

  # examples
  'MIT'
)

depends=(
  "qt${_qt_version:-5}-base"
  "qt${_qt_version:-5}-location"
)
makedepends=(
  'cmake'
  'git'
  'glfw'
  'libwebp'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="maplibre.maplibre-native-qt"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1
}

pkgver() (
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
)

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSES"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # from readme
  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'END'
Copyright (C) 2023 MapLibre contributors

The core library may be used under 2-Clause BSD License.
QML bindings may be used under the terms of either GNU General Public License version 2.0,
GNU General Public License version 3.0 or GNU Lesser General Public License version 3.0.
Examples are licensed under MIT.
Full texts of the licenses can be found in the [LICENSES](LICENSES) directory.

Each file contains corresponding license information with SPDX license identifiers
to clarify how it can be used.
END
}
