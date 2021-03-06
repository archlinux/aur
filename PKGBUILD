# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kalk-git
pkgver=v0.2.r30.g1b04b29
pkgrel=1
pkgdesc="Kalk is a powerful cross-platfrom calculator application built with the Kirigami framework"
arch=('x86_64')
url="https://invent.kde.org/plasma-mobile/kalk"
license=('GPL3')
depends=('ki18n' 'kconfig' 'kcoreaddons' 'knotifications' 'kirigami2' 'kunitconversion'
         'kdbusaddons' 'plasma-framework' 'gmp' 'mpfr' 'qt5-feedback')
makedepends=('git' 'qt5-tools' 'extra-cmake-modules')
provides=('kalk')
conflicts=('kalk')
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
  cd "${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd "${pkgname%-git}"
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
