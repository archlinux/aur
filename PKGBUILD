# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-phonebook-git
pkgver=r163.869a837
pkgrel=1
pkgdesc="Phone book for Plasma Mobile"
arch=('x86_64')
url="https://invent.kde.org/plasma-mobile/plasma-phonebook"
license=('GPL3')
depends=('ki18n' 'kcoreaddons' 'kconfig' 'kpeople' 'kcontacts' 'kpeoplevcard' 'kirigami2')
makedepends=('git' 'extra-cmake-modules')
provides=('plasma-phonebook')
conflicts=('plasma-phonebook' 'plasma-mobile-phonebook')
source=("git+${url}.git")
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
  cmake ..
  make
}

package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
}
