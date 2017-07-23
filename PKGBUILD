# Maintainer: T. Witt
pkgname=plasma5-applets-analog24hclock
pkgver=99999999
pkgrel=1
pkgdesc="Analog 24h clock"
arch=('i686' 'x86_64')
url="https://github.com/sleepywitti/analog24hclock-plasmoid/"
license=('GPL3')
depends=(
  plasma-framework
  plasma-workspace
  kconfigwidgets
  kxmlgui
)
makedepends=(git)
source=("${pkgname}::git+https://github.com/sleepywitti/analog24hclock-plasmoid.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}"

  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd build
  make DESTDIR="$pkgdir/" install
}
# vim:set ts=2 sw=2 et:
