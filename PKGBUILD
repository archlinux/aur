# Maintainer:
# Contributor: 2xsaiko <aur@dblsaiko.net>

_pkgname="kwin-effect-rounded-corners"
pkgname="$_pkgname-git"
pkgver=0.6.6.r6.g0e1fa34
pkgrel=1
pkgdesc="Rounds the corners of your windows"
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=("GPL-2.0-or-later")
arch=('x86_64')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

depends=(
  'kwin'

  ## implicit
  #kcmutils
  #kconfig
  #kcoreaddons
  #kwidgetsaddons
  #libepoxy
  #qt6-base
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'
)

_pkgsrc="kde-rounded-corners"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

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
