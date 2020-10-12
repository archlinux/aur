# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=calindori-git
pkgver=v1.2.r22.gc4ee655
pkgrel=1
pkgdesc="Calendar for Plasma Mobile"
arch=(x86_64)
url="https://invent.kde.org/plasma-mobile/calindori"
license=(GPL3)
depends=(ki18n kcoreaddons kconfig kcalendarcore kirigami2)
makedepends=(git cmake extra-cmake-modules qt5-tools)
provides=(calindori)
conflicts=(calindori)
source=("git+https://invent.kde.org/plasma-mobile/calindori.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
  install -d build
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
}
