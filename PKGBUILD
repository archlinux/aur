# Maintainer: Janek Graff <janek.graff at gmx dot com>
# This is a modified version of xorlys' serialplot-hg package (https://aur.archlinux.org/packages/serialplot-hg)
# It changes the upstream to the git repository and uses the qwt dependency that is delivered by the build process of serialplot
pkgname=serialplot-git
_pkgname=serialplot
pkgver=v0.12.0.r24.gd130116
pkgrel=1
pkgdesc="Small and simple software for plotting data from serial port in realtime"
arch=('i686' 'x86_64')
url="https://github.com/hyOzd/serialplot"
license=('GPL3')
depends=('qt6-base' 'qt6-serialport' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'make')
provides=('serialplot')
conflicts=('serialplot-hg')
source=('git+https://github.com/hyOzd/serialplot.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_CXX_FLAGS=-DUPDATE_TYPE_PKGMAN -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}
package() {
  cd "$srcdir/$_pkgname"
  cd build
  make DESTDIR="${pkgdir}" install
}
