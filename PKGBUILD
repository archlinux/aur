# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-phonebook-git
pkgver=24.02.0.r37.g5b4033d
pkgrel=1
pkgdesc="Phone book for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/plasma-phonebook"
license=('GPL-3.0-only')
depends=('ki18n' 'kcoreaddons' 'kconfig' 'kpeople' 'kcontacts' 'kirigami' 'kirigami-addons')
makedepends=('git' 'extra-cmake-modules' 'qt6-svg' 'qt6-tools')
provides=('plasma-phonebook')
conflicts=('plasma-phonebook' 'plasma-mobile-phonebook')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | \
      sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S "${pkgname%-git}"
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
