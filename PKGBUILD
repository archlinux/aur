# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kasts-git
pkgver=22.06.r12.gfbe745d
pkgrel=1
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
pkgdesc="Kirigami-based podcast player"
url="https://invent.kde.org/plasma-mobile/kasts"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-quickcontrols2' 'qtkeychain-qt5' 'purpose' 'kirigami2'
         'ki18n' 'kconfig' 'kcoreaddons' 'ki18n' 'syndication' 'taglib' 'threadweaver')
makedepends=('extra-cmake-modules' 'git' 'qt5-svg' 'qt5-tools')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
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
