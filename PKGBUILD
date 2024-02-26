# Maintainer:
# Contributor: archlinux.info:tdy

_pkgname="cutechess"
pkgname="$_pkgname-git"
pkgver=1.3.1.r0.g1071d84c
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

provides=(
  "cutechess=${pkgver%%.r*}"
  "cutechess-cli=${pkgver%%.r*}"
)
conflicts=(
  "cutechess"
  "cutechess-cli"
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

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
