# Maintainer: Tom Zander

pkgname=flowee-pay
pkgver=2023.11.1
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64' 'aarch64')
url="http://flowee.org/"
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-shadertools' 'qt6-scxml')
makedepends=('boost' 'cmake' 'flowee>=2023.11.1' 'qt6-tools')
provides=('flowee-pay')
install=flowee-pay.install
source=("https://codeberg.org/Flowee/pay/archive/$pkgver.tar.gz"
    "https://flowee.org/products/pay/blockheaders-810000")
sha256sums=('d99599b31d95b624139ab241ce2026b7ff3d5491d3ccbb2f1af630dbd3df66df'
    '73b42d844639266afa8b9c8e31239e64c0890541b219dc6194c5d3d9a4b8354b')

build() {
  ln -sf "$srcdir/blockheaders-810000" "$srcdir/blockheaders"
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
  rm -f "$pkgdir/bin/pay_mobile"

  # install blockheaders to avoid first-run download
  install -Dm 644 "$srcdir/blockheaders" -t "$pkgdir/usr/share/floweepay"
}
