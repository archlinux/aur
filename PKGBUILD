# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=pcf-unifont-extra
pkgver=15.1.05
pkgrel=1
pkgdesc="GNU Unifont Glyphs (PCF version, bold and italic)"
arch=('any')
url="https://unifoundry.com/unifont/index.html"
license=('OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0')
makedepends=('mkbold-mkitalic' 'xorg-bdftopcf')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.bdf.gz"{,.sig}
        "https://unifoundry.com/LICENSE.txt")
sha256sums=('8ea5b5a14d71e3353d1fea373f5d88d198ad1e285cedd8294655926ee11fd91d'
            'SKIP'
            '1e74cb82bf476843e97c2596297b04219b1a7e51f7238944a8c031cb9401fa87')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

build() {
  cd "$srcdir"
  local _type
  for _type in bold italic bolditalic; do
    "mk$_type" "unifont-$pkgver.bdf" | bdftopcf | gzip -c >"unifont-$_type-$pkgver.pcf.gz"
  done
}

package() {
  cd "$srcdir"
  local _type
  for _type in bold italic bolditalic; do
    install -Dm644 "unifont-$_type-$pkgver.pcf.gz" \
      "$pkgdir/usr/share/fonts/misc/unifont-$_type.pcf.gz"
  done
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
