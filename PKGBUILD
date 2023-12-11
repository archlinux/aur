# Maintainer:
# Contributor: Thiago Almeida <thiagoalmeidasa at gmail dot com>
# Contributor: Christopher Heien <chris.h.heien@gmail.com>
# Contributor: Stéphane Brunet <stephane at stephanebrunet dot net>

_pkgname="iscan-plugin-gt-s80"
pkgname="$_pkgname"
pkgver=1.0.1
pkgrel=1
pkgdesc="iscan plugin for Epson GT-S50 and GT-S80 scanners"
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
arch=('i686' 'x86_64')
license=('custom')

#optdepends=('iscan-plugin-esdip: provides auto-crop and deskew function')

install=gt-s80.install

noextract=(
  iscan-gt-s80-bundle-2.30.4.x86.deb.tar.gz
  iscan-gt-s80-bundle-2.30.4.x64.deb.tar.gz
)

source_i686=(https://download2.ebz.epson.net/iscan/plugin/gt-s80/deb/x86/iscan-gt-s80-bundle-2.30.4.x86.deb.tar.gz)
sha256sums_i686=('ad619ff37b165dadce3efd89559e2bc9a7b4596c5fc223378ef66af53314ca20')

source_x86_64=(https://download2.ebz.epson.net/iscan/plugin/gt-s80/deb/x64/iscan-gt-s80-bundle-2.30.4.x64.deb.tar.gz)
sha256sums_x86_64=('082b34012024b501161d93991d6b3cb4ffc8ddcb71ec485ad8683f98237d47d9')

prepare() {
  case "$CARCH" in
    x86_64)
      _filename="iscan-gt-s80-bundle-2.30.4.x64.deb.tar.gz"
      _deb_arch="amd64"
      ;;
    i686)
      _filename="iscan-gt-s80-bundle-2.30.4.x86.deb.tar.gz"
      _deb_arch="i386"
      ;;
  esac

  bsdtar -xf "$_filename" --strip-components 1 */plugins/*

  mkdir -p esci-interpreter iscan-plugin-esdip prepare

  bsdtar -C esci-interpreter -xf "plugins/esci-interpreter-gt-s80_1.0.0-1_$_deb_arch.deb"
  bsdtar -C iscan-plugin-esdip -xf "plugins/iscan-plugin-esdip_1.0.1-1.ltdl7_$_deb_arch.deb"

  bsdtar -C prepare -xf esci-interpreter/data.tar.gz
  bsdtar -C prepare -xf iscan-plugin-esdip/data.tar.gz
}

package() {
  depends=(
    'iscan'
    'iscan-data'
  )

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  cp --reflink=auto -r prepare/usr/lib "$pkgdir/usr/"
  cp --reflink=auto -r prepare/usr/share/iscan "$pkgdir/usr/share/"

  gzip -dc prepare/usr/share/doc/esci-interpreter-gt-s80/COPYING.EPSON.en.txt.gz > "$pkgdir/usr/share/licenses//$pkgname/COPYING.EPSON.en.txt"
  gzip -dc prepare/usr/share/doc/esci-interpreter-gt-s80/COPYING.EPSON.ja.txt.gz > "$pkgdir/usr/share/licenses//$pkgname/COPYING.EPSON.ja.txt"
}
