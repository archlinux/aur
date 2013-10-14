# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=xrick
pkgver=021212
pkgrel=9
pkgdesc='A clone of Rick Dangerous'
arch=('i686' 'x86_64')
url='http://www.bigorno.net/xrick'
install="$pkgname.install"
license=('custom: spirit of GPL')
depends=('sdl' 'zlib')
makedepends=('imagemagick')
source=("http://www.bigorno.net/xrick/$pkgname-$pkgver.zip"
        "$pkgname.desktop"
        "$pkgname.install")
md5sums=('6a56d23679f51c602b285642c6451fb6'
         '4b7d95acef1c6c14527d7d3a7f702ebc'
         'a2be0f43954eb8a37dd807435e843ab1')
sha256sums=('2a167169ccdb2c108e97d5d021da9be29356d756283f1c20d5a7ad121b4accf0'
            '9bf9d3f063dc0cc5ce256cc2fd3475512628d68a5efcf87f4a64878956d8bba0'
            'e8577e66ae08d597d908eb0d04792c890b04f7ecd463f9d601d2b244e04614d2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # change data path
  sed -i 's|"data.zip"|"/usr/share/xrick/data.zip"|' src/xrick.c

  # add our build flags
  sed -i "s|cflags)|cflags) ${CXXFLAGS}|" Makefile

  make

  # create icon
  convert src/xrickST.ico xrick.png

  # change data path in manual page
  gunzip xrick.6.gz
  sed -i 's|where xrick is|/usr/share/xrick.|' xrick.6
  sed -i 's|run from.||' xrick.6
  gzip xrick.6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # install binary, icon, data, manual and desktop files
  install -d "$pkgdir"/usr/{bin,man/man6,share/{xrick,applications,pixmaps}}
  install -m755 xrick "$pkgdir/usr/bin/xrick"
  install -m644 {data.zip,KeyCodes} "$pkgdir/usr/share/xrick/"
  install -m644 xrick.6.gz "$pkgdir/usr/man/man6/"
  install -m644 "$srcdir/xrick.desktop" "$pkgdir/usr/share/applications/"
  install -m644 xrick.png "$pkgdir/usr/share/pixmaps/"
}
