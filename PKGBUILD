# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2-non-free-plugin
pkgver=1.0.0.6
pkgrel=5
arch=('armv7h' 'i686' 'x86_64')
pkgdesc="Plugins for Epson Scan 2"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('LicenseRef-EULA')
depends=('epsonscan2')
makedepends=('bbe')
source_armv7h=("https://download3.ebz.epson.net/dsc/f/03/00/17/08/16/ec9aaa15e4cc6ae6bb906ce999595644426ad2c8/epsonscan2-bundle-6.7.80.0.armv7l.deb.tar.gz")
source_i686=("https://download3.ebz.epson.net/dsc/f/03/00/17/08/13/322979d7491bf5a2fd0ef05aaba0226f6e2023f8/epsonscan2-bundle-6.7.80.0.i686.deb.tar.gz")
source_x86_64=("https://download3.ebz.epson.net/dsc/f/03/00/17/08/12/9f3fec0ae80aa5c36f5170377ebcc38c93251e23/epsonscan2-bundle-6.7.80.0.x86_64.deb.tar.gz")
b2sums_armv7h=('c95eb6396410eea82c7fbb29317172e5a0b38e6b45f207625a2fa97431d118f4b0ce468dc9b245437c49a2a387f7cb94716a19b6bcb1a7c5266b6010fa6d6b63')
b2sums_i686=('7a41ab04ee13fb9a22465cd80a8af4ec3099366f6af2d3f1911fe491b67444c3520ceb165730c72bc751cdefc606c303a62809ff292597c0ed086a860c900e15')
b2sums_x86_64=('cb27c9554d1c11fa67484a3b5012693e6469aec18221192134512cde305e377b52681e4f91bbf4d77573c8e87fa35743f24dcac994f8f688abafcf7b7947bd11')

prepare() {
  cd epsonscan2-bundle*/plugins
  ar x epsonscan2-non-free-plugin*.deb
  tar -xJf data.tar.xz -C "$srcdir"

  # The “es2intif” program looks for libraries in the default Debian directory:
  # /usr/lib/x86_64-linux-gnu/epsonscan2/
  # This command updates to the path used in this package:
  # /usr/lib/epsonscan2/
  cd "$srcdir"/usr/lib/*/epsonscan2/non-free-exec
  case $CARCH in
    armv7h)
      bbe -e "s|arm-linux-gnueabihf/epsonscan2/|epsonscan2/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00|" es2intif > es2intif.alt
    ;;
    i686)
      bbe -e "s|i386-linux-gnu/epsonscan2/|epsonscan2/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00|" es2intif > es2intif.alt
    ;;
    x86_64)
      bbe -e "s|x86_64-linux-gnu/epsonscan2/|epsonscan2/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00|" es2intif > es2intif.alt
    ;;
  esac
  mv es2intif.alt es2intif
  chmod +x es2intif
}

package() {
  install -d "$pkgdir/usr/lib/"
  cd "$srcdir/usr"
  mv lib/*/epsonscan2* "$pkgdir/usr/lib"
  mv libexec/epsonscan2-ocr/ocr-engine-getrotate "$pkgdir/usr/lib/epsonscan2-ocr"
  mv share "$pkgdir/usr"
  install -Dm644 "$pkgdir/usr/share/doc/$pkgname-$pkgver-1/copyright" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
