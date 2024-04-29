# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Frane Bandov <frane@offbyte.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=log4net
pkgver=2.0.8
pkgrel=3
pkgdesc="A tool to help the programmer output log statements to a variety of output targets"
arch=('any')
url="https://logging.apache.org/log4net/"
license=('Apache')
depends=('mono')
source=(https://archive.apache.org/dist/logging/$pkgname/source/$pkgname-$pkgver-src.zip{,.asc}
        $pkgname.pc)
validpgpkeys=('CE8075A251547BEE249BC151A2115AE15F6B8B72') # Stefan Bodewig
sha256sums=('5b4ab2c7753f64fd8d2ca82b553e367c3b5accbed5103ce6a455ab156f7fa08e'
            'SKIP'
            '6ce4f40252e0716fb098149e99d1763d7290cc55cc2ccd1420456b1a3b33bb2d')

prepare() {
  cd $pkgname-$pkgver
  sed -i "s/@VERSION@/$pkgver/" "$srcdir/$pkgname.pc"
}

build() {
  cd $pkgname-$pkgver
  mkdir bin
  mcs -t:library -out:bin/$pkgname.dll -keyfile:$pkgname.snk -d:NET_2_0 \
      -r:System,System.Data,System.Xml,System.Web,System.Net,System.Configuration \
      $(find src -name "*.cs")
}

package() {
  cd $pkgname-$pkgver
  gacutil -i bin/$pkgname.dll -package $pkgname -root "$pkgdir/usr/lib/"
  install -Dm644 "$srcdir/$pkgname.pc" "$pkgdir/usr/lib/pkgconfig/$pkgname.pc"
}
