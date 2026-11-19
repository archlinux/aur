# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Contributor: Dominik Schwimmbeck

pkgname=horcom-git
_pkgname=horcom
pkgver=0.89.r0.gde999ad
pkgrel=1
pkgdesc="Complete desktop astrology program and chart calculator (C++ rewrite of Robert Rettig's HORCOM)"
arch=('x86_64')
url="https://github.com/horcom-rr/HORCOM"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg')
makedepends=('git' 'cmake' 'qt6-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/horcom-rr/HORCOM.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="-Wno-error=format-truncation"
  cmake --build build
}

check() {
  cd "$_pkgname"
  ctest --test-dir build --output-on-failure
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" cmake --install build
}
