# Maintainer:
# Contributor: Dāvis Mosāns <davispuh at gmail dot com>

_pkgname="polkit-qt5"
pkgname="$_pkgname-git"
pkgver=0.200.0.r1.ge01dc18
pkgrel=1
pkgdesc='A library that allows developers to access PolicyKit API with a nice Qt-style API'
url='https://invent.kde.org/libraries/polkit-qt-1'
license=('BSD-3-Clause' 'GPL-2.0-or-later' 'LGPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'polkit'
  'qt5-base'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm644 "$_pkgsrc"/LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
