# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=giana
pkgver=1.001
_pkgver=${pkgver//./}
pkgrel=3
pkgdesc="Giana's Return, unofficial sequel to the (in)famous Mario clone Great Giana Sisters"
arch=('i686' 'x86_64')
url="http://www.gianas-return.de"
license=('custom: Freeware')
depends=('sdl_mixer' 'zlib' 'glut' 'glu')
optdepends=('libmodplug: better music decoder')
install=$pkgname.install
options=(!strip)
source=("http://www.gianas-return.de/gr-v$_pkgver-ubuntu.zip"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname-fs.desktop")
sha256sums=('cf932707776c25444cb9ff9feb91489886efdc3764aa6aeeb53845f7c1816970'
            'e42996d0a09c6384fe0af413f8737256fd79f5d1094b1074018e4404a68246da'
            'ea2452f45c2edeb9acac12294ff759e465e010fa997cc2fdf9d2ab57af76a0d9'
            '80aa0cd19c742199c69b7c1778f28c8f75aa6646c2b3a26ae6eed608b2d6a7a4')

package() {
  # create folders
  install -d "$pkgdir"/{opt/$pkgname/data,usr/share/{doc,licenses}/$pkgname}

  # install architecture dependent executeable
  case $CARCH in
    i686)
      install -m755 ${pkgname}_ubuntu32 "$pkgdir"/opt/$pkgname/$pkgname;;
    x86_64)
      install -m755 ${pkgname}_ubuntu64 "$pkgdir"/opt/$pkgname/$pkgname;;
  esac

  # install data files and create license file
  install -m644 data/*.zda "$pkgdir"/opt/$pkgname/data
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname
  tail -n +45 readme.txt | head -n 8 > "$pkgdir"/usr/share/licenses/$pkgname/FREEWARE

  # set group permission of folder, so we can save highscores and config later
  chgrp games "$pkgdir"/opt/$pkgname
  chmod g+w "$pkgdir"/opt/$pkgname

  # install launcher and desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
