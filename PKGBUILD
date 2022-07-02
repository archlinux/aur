# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=station-git
pkgver=2.1.2.r4.gfe4f056
pkgrel=1
pkgdesc="Convergent terminal emulator"
arch=('x86_64')
groups=('maui-apps')
url="https://invent.kde.org/maui/station"
license=('GPL3')
depends=('kio' 'mauikit-git' 'ki18n' 'qmltermwidget')
makedepends=('git' 'extra-cmake-modules')
provides=('station')
conflicts=('station')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | \
      sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
  )
}

prepare() {
  cd "${pkgname%-git}"
  mkdir build
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}
 
package() {
  cd "${pkgname%-git}/build"
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 ../src/assets/station.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/maui-station.svg"
  make DESTDIR="$pkgdir" install
}
