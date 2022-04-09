# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: grimi <grimi at poczta dot fm>

pkgname=xrick
pkgver=021212
pkgrel=11
pkgdesc='Clone of Rick Dangerous, a classic platform game'
arch=('i686' 'x86_64')
url='http://www.bigorno.net/xrick'
license=('custom: spirit of GPL')
depends=('sdl' 'zlib')
makedepends=('imagemagick')
source=("http://www.bigorno.net/xrick/$pkgname-$pkgver.zip"
        "$pkgname.desktop"
        "$pkgname-fs.desktop")
sha256sums=('2a167169ccdb2c108e97d5d021da9be29356d756283f1c20d5a7ad121b4accf0'
            '3dda77a8017e35767c8339fb92ce0a554912c98af33fb75e986ca1d30d40c320'
            '5d8c57aeb0b4e445576f86aaa8b851315c4c31d03544f7ad4b95c9507551a625')

prepare() {
  cd $pkgname-$pkgver

  # change data path
  sed 's|"data.zip"|"/usr/share/xrick/data.zip"|' -i src/xrick.c
  # add our build flags and gcc10+ fix
  sed "s|CFLAGS=|CFLAGS+=-fcommon |;s|LDFLAGS=|LDFLAGS+=|" -i Makefile
  # fix format-security
  sed 's|printf(s)|printf("%s\\n", s)|' -i src/system.c

  # create icon
  convert src/xrickST.ico xrick.png

  # change data path in manual page
  gunzip xrick.6.gz
  sed 's|where xrick is|/usr/share/xrick.|;s|run from.||' -i xrick.6
  gzip xrick.6
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  # binary
  install -Dm755 xrick "$pkgdir"/usr/bin/xrick
  # data
  install -d "$pkgdir"/usr/share/xrick
  install -m644 {data.zip,KeyCodes} "$pkgdir"/usr/share/xrick/
  # doc + license
  install -Dm644 xrick.6.gz "$pkgdir"/usr/share/man/man6/xrick.6.gz
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 README "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  sed '5,27!d' -i "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  # .desktop files
  install -Dm644 ../xrick.desktop "$pkgdir"/usr/share/applications/xrick.desktop
  install -m644 ../xrick-fs.desktop "$pkgdir"/usr/share/applications
  install -Dm644 xrick.png "$pkgdir"/usr/share/pixmaps/xrick.png
}
