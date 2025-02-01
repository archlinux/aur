# Maintainer: Tom Zander

pkgname=flowee-pay
pkgver=2025.01.1
options=(!lto)
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64' 'aarch64')
url="http://flowee.org/"
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-shadertools' 'qt6-scxml' 'zxing-cpp' 'qt6-multimedia')
makedepends=('boost' 'cmake' 'flowee>=2025.01.1' 'qt6-tools')
provides=('flowee-pay')
install=flowee-pay.install
source=("https://codeberg.org/Flowee/pay/archive/$pkgver.tar.gz"
    "https://flowee.org/products/pay/blockheaders-850000")
sha256sums=('387de0d2275caed99b74fa44ea3befd959309d8eb0aef83bc2080af6e697a58a'
    '4a98c3b655cfd7520b4d4f682d95e3a82e0f03fda4fa687d28f2127205d66047')

build() {
  ln -sf "$srcdir/blockheaders-850000" "$srcdir/blockheaders"
  mkdir -p build
  cd build
  cmake -Dbuild_mobile_pay=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../pay
  make
}

check() {
    cd build/testing
    make check
}

package() {
  cd build
  make install
  # de-install pay_mobile
  rm -f "$pkgdir/bin/pay_mobile"

  # install blockheaders to avoid first-run download
  install -Dm 644 "$srcdir/blockheaders" -t "$pkgdir/usr/share/floweepay"
}
