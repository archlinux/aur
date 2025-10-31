# Maintainer:
# Contributor: 2xsaiko <aur@dblsaiko.net>

_pkgname="kwin-effect-rounded-corners"
pkgname="$_pkgname-git"
pkgver=0.8.5.r5.ge7462df
pkgrel=2
pkgdesc="Rounds the corners of your windows (wayland)"
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=("GPL-3.0-only")
arch=('x86_64')

depends=(
  'kwin'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'
)
optdepends=(
  'kwin-effect-rounded-corners-x11-git: for X11 support'
)

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

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
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
