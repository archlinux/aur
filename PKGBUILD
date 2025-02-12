# Maintainer:
# Contributor: easymodo <easymodofrf@gmail.com>

_pkgname="qimgv"
pkgname="$_pkgname-git"
pkgver=1.0.2.r160.gc913500
pkgrel=1
pkgdesc="Qt image viewer with video playback"
url="https://github.com/easymodo/qimgv"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'exiv2'
  'mpv'
  'opencv'
  'qt6-base'
  'qt6-imageformats'
  'qt6-multimedia'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt6-tools'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  sed -E -e 's/Qt5_FOUND/FALSE/' \
    -e '/\bQt5\b/d' \
    -i CMakeLists.txt
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
