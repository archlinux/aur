# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=daykountdown-git
pkgver=r189.357fb6d
pkgrel=1
pkgdesc="A simple date countdown app written for KDE Plasma, using Kirigami."
arch=(x86_64)
url="https://invent.kde.org/plasma-mobile/daykountdown"
license=(GPL3)
depends=(ki18n kconfig kcoreaddons kwidgetsaddons kirigami2 kio qt5-svg)
makedepends=(git extra-cmake-modules)
provides=(daykountdown)
conflicts=(daykountdown)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname%-git}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
