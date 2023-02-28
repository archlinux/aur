# Maintainer: Tom Zander

pkgname=flowee-pay
pkgver=2023.02.1
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64' 'aarch64')
url="http://flowee.org/"
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-shadertools' 'qt6-scxml')
makedepends=('boost' 'cmake' 'flowee>=2023.02.1' 'qt6-tools')
provides=('flowee-pay')
install=flowee-pay.install
source=("https://codeberg.org/Flowee/pay/archive/$pkgver.tar.gz"
    "https://flowee.org/products/pay/blockheaders")
sha256sums=('81cf813e914a2b9412a4232130aa231016b8d0fbc16e2cd23aec669854a38952'
    '310eead86791f205dae99d192de9f044c9060bba7d37b9fbde45fc69634cf96a')

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
