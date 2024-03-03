# Maintainer:
# Contributor: 2xsaiko <aur@dblsaiko.net>

_gitname="kde-rounded-corners"
_pkgname="kwin-effect-rounded-corners"
pkgname="$_pkgname-git"
pkgver=0.6.1.r3.g12a50941
pkgrel=1
pkgdesc="Rounds the corners of your windows"
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=("GPL-2.0-or-later")
arch=('x86_64')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

depends=(
  'kwin'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'qt5-tools'
  'qt6-tools'
)

_pkgsrc="$_gitname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE="Release"
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
