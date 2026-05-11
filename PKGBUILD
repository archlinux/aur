# Maintainer: Sourajyoti Basak <wiz28@protonmail.com>

_pkgname=kwin-effects-kdeblur
pkgname=${_pkgname}-git
pkgver=r428.4f86e77
pkgrel=1
pkgdesc="KDE Plasma 6 Better Blur fork (X11 & Wayland)"
arch=('x86_64')
url="https://github.com/can1357/kde-blur"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=("kwin-x11: for X11" "kwin: for Wayland")
makedepends=(git extra-cmake-modules qt6-tools kwin kwin-x11)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy)

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  (
    set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # Arch Requirement: Install the license file
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
