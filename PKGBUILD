# Maintainer: DawfukFR <dawfukfr@gmail.com>
# Contributor: vicr123 <vicr12345@gmail.com>

: ${_pkgtype=-git}

_pkgname="polkit-qt"
pkgbase="polkit-qt6${_pkgtype:-}"
pkgver=0.200.0.r1.ge01dc18
pkgrel=1
pkgdesc='A library that allows developers to access PolicyKit API with a nice Qt-style API'
url='https://invent.kde.org/libraries/polkit-qt-1'
license=(
  'BSD-3-Clause'
  'GPL-2.0-or-later'
  'LGPL-2.0-or-later'
)
arch=('x86_64')

depends=(
  'glib2'
  'polkit'
)
makedepends=(cmake
  'git'
  'ninja'
  'qt5-base'
  'qt6-base'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://invent.kde.org/libraries/polkit-qt-1.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

_build_qt5() (
  local _cmake_qt5=(
    -B build5
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DQT_MAJOR_VERSION=5
    -Wno-dev
  )

  cmake "${_cmake_qt5[@]}"
  cmake --build build5
)

_build_qt6() (
  local _cmake_qt6=(
    -B build6
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DQT_MAJOR_VERSION=6
    -Wno-dev
  )

  cmake "${_cmake_qt6[@]}"
  cmake --build build6
)

build() {
  _build_qt5
  _build_qt6
}

_package_polkit-qt5() {
  depends+=(qt5-base)
  provides=("polkit-qt5=${pkgver%%.r*}")
  conflicts=('polkit-qt5')

  DESTDIR="$pkgdir" cmake --install build5
  install -Dm644 "$_pkgsrc"/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

_package_polkit-qt6() {
  depends+=(qt6-base)
  provides=("polkit-qt6=${pkgver%%.r*}")
  conflicts=('polkit-qt6')

  DESTDIR="$pkgdir" cmake --install build6
  install -Dm644 "$_pkgsrc"/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

pkgname=(
  "polkit-qt5${_pkgtype:-}"
  "polkit-qt6${_pkgtype:-}"
)

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_${_p%${_pkgtype:-}}")
    _package_${_p%${_pkgtype:-}}
  }"
done
