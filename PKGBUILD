# Maintainer:

_pkgname="kwin-effect-rounded-corners"
pkgname="$_pkgname-x11-git"
pkgver=0.8.7.r4.g588d9e4
pkgrel=2
pkgdesc="Rounds the corners of your windows (x11)"
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=("GPL-3.0-only")
arch=('x86_64')

depends=(
  'kwin-x11'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'kwin'
  'git'
  'ninja'
)

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

options=('!emptydirs')

_pkgsrc="kde-rounded-corners"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

prepare() {
  # ensure Qt6
  sed -E -e 's&\bQUIET\b&REQUIRED&' -i "$_pkgsrc/cmake/qtversion.cmake"
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
    -DKWIN_X11=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
