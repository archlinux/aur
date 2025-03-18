# Maintainer:

_pkgname="gimp-plugin-gmic"
pkgname="$_pkgname-git"
pkgver=3.5.0.r0.g41e86b9
pkgrel=4
pkgdesc="Gimp plugin for the G'MIC image processing framework"
url="https://github.com/GreycLab/gmic-qt"
license=('CECILL-C')
arch=('x86_64')

depends=(
  'fftw'
  'gimp'
  'glib2'
  'gmic'
  'libx11'
  'qt6-base'
  'zlib'
)

makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt6-tools'
)

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

_pkgsrc="greyclab.gmic-qt"
source=("$_pkgsrc"::"git+https://github.com/GreycLab/gmic-qt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  # Allow build type None
  sed -E -e '/CMAKE_BUILD_TYPE/s&FATAL_ERROR&STATUS&' -i "$_pkgsrc/CMakeLists.txt"
}

build() (
  # lrelease
  export PATH="/usr/lib/qt6/bin:$PATH"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_WITH_QT6=ON
    -DGMIC_QT_HOST=gimp3
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
