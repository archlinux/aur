# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kirigami-addons-git
pkgver=0.3.r0.g917a0fa
pkgrel=1
pkgdesc="Add-ons for the Kirigami framework"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/libraries/kirigami-addons"
license=(GPL3)
depends=('ki18n' 'kirigami2')
makedepends=('git' 'extra-cmake-modules')
provides=(kirigami-addons)
conflicts=(kirigami-addons)
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
