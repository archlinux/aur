# Maintainer: Tom Zander

pkgname=flowee-pay
pkgver=2022.08.0
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64' 'aarch64')
url="http://flowee.org/"
license=('GPL3')
depends=('qt5-base')
makedepends=('boost' 'cmake' 'flowee>=2022.07.0')
provides=('flowee-pay')
install=flowee-pay.install
source=("https://codeberg.org/Flowee/pay/archive/$pkgver.tar.gz"
    "https://flowee.org/products/pay/blockheaders")
sha256sums=('782deb2346cdc87c835d5a0419637d080e95947965599521672a2b87fe97dd74'
    '8c2dfde998b4472aea25daa1e4bfe7bcca0b765145ee740bd8cfb0152400abce')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../pay
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
  rm -f "$pkgdir/bin/flowee_mobile"

  # install blockheaders to avoid first-run download
  install -Dm 644 "$srcdir/blockheaders" -t "$pkgdir/usr/share/floweepay"
}
