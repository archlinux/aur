# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=twinkle
pkgname=${_pkgname}-git
pkgver=1.10.3.r480.355813d
pkgrel=1
pkgdesc="A SIP-based VoIP client"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url=https://twinkle.dolezel.info
license=('GPL-2.0-only')
depends=('libsndfile' 'bcg729' 'speex' 'libzrtpcpp' 'qt5-declarative' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/lubosd/twinkle.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo -n "$(grep -E '^set\(PRODUCT_VERSION' CMakeLists.txt | awk -F \" '{print $2}')."
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build && cd build
  cmake ../$_pkgname -DCMAKE_INSTALL_PREFIX=/usr -DWITH_G729=ON -DWITH_SPEEX=ON -DWITH_ZRTP=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
