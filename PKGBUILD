# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Ricardo Leuck <leuck.r at gmail>

pkgname=brewtarget-git
pkgver=2.3.1.r357.g8b2c8f7
pkgrel=1
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="http://www.brewtarget.org/"
arch=('x86_64' 'i686')
license=('GPL3' 'custom:WTFPL')
depends=('qt5-tools' 'qt5-multimedia' 'qt5-svg')
makedepends=('cmake' 'git')
conflicts=(brewtarget)
provides=(brewtarget)
source=("git+https://github.com/Brewtarget/brewtarget.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  [[ -d build ]] && rm -rf build
  mkdir build
}

build() {
  cd build
  cmake ../brewtarget \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDO_RELEASE_BUILD=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../brewtarget/COPYING.WTFPL \
    "$pkgdir"/usr/share/licenses/$pkgname/COPYING.WTFPL
}
