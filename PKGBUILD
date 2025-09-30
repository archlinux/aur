# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=pcf-unifont-extra
pkgver=17.0.01
pkgrel=1
pkgdesc="GNU Unifont Glyphs (PCF version, bold and italic)"
arch=('any')
url="https://unifoundry.com/unifont/index.html"
license=('OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0')
makedepends=('mkbold-mkitalic' 'xorg-bdftopcf')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.bdf.gz"{,.sig}
        "unifont-LICENSE.txt::https://unifoundry.com/LICENSE.txt")
sha256sums=('df6bd412669f8a4b56d3f43b0f1e026155eecd74b073473061f0633ad11b037e'
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
  install -Dm644 unifont-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
