# Maintainer: Bart De Vries <bart at mogwai dot be>
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kasts-git
pkgver=23.01.0.r114.g761e6762
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="Kirigami-based podcast player"
url="https://invent.kde.org/multimedia/kasts"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-quickcontrols2' 'qtkeychain-qt5' 'kirigami2' 'ki18n'
         'kconfig' 'kcoreaddons' 'syndication' 'taglib' 'threadweaver' 'vlc'
         'kirigami-addons')
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
