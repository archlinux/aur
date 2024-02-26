# Maintainer:
# Contributor: archlinux.info:tdy

_pkgname="cutechess"
pkgname="$_pkgname"
pkgver=1.3.1
pkgrel=1
pkgdesc="Tools for working with chess engines"
url="https://github.com/cutechess/cutechess"
license=('GPL-3.0-or-later')
arch=(i686 x86_64)

depends=(
  qt5-svg

  ## implicit
  # qt5-base
)
makedepends=(
  cmake
  doxygen
  git
)

provides=("cutechess-cli=${pkgver%%.r*}")
conflicts=("cutechess-cli")

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('b6b76f11a53b89ba38e2d21ed180a51ce95e963e1ae2054a352563cad075e2f8')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"

    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # fix icon
  install -Dm644 "$pkgdir/usr/share/icons/application/256x256/apps/cutechess.png" -t "$pkgdir/usr/share/pixmaps/"
  rm -rf "$pkgdir/usr/share/icons/"
}
