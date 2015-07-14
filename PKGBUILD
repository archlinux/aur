# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=dbg2olc-bin
pkgver=1.0
pkgrel=1
pkgdesc="Efficient Assembly of Large Genomes Using the Compressed Overlap Graph"
arch=('x86_64' 'i686')
url="https://sites.google.com/site/dbg2olc/"
license=('custom')
optdepends=('blasr' 'pbdagcon' 'python2')
makedepends=('catdoc')
source=("$pkgname-$pkgver.zip::https://sites.google.com/site/dbg2olc/home/Programs.zip")
md5sums=('bbb67d927f8fe78d6c96f3ada168291c')

prepare() {
  cd $srcdir/Programs

  unzip -o split_and_run_pbdagcon.zip

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -i split_reads_by_backbone.py

  sed -e '/split_reads_by_backbone.py/i cd /usr/share/dbg2olc-bin' \
      -e 's|./split_reads_by_backbone.py|python2 split_reads_by_backbone.py|' \
      -i split_and_run_pbdagcon.sh
}

package() {
  cd $srcdir/Programs

  mkdir -p $pkgdir/usr/share/$pkgname

  install -Dm644 <(catdoc DBG2OLC\ License\ Agreement.doc) $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -Dm755 DBG2OLC_Linux $pkgdir/usr/bin/DBG2OLC_Linux
  install -Dm644 DBG2OLC_Manual.docx $pkgdir/usr/share/doc/$pkgname/DBG2OLC_Manual.docx
  install -Dm755 split_and_run_pbdagcon.sh $pkgdir/usr/bin/split_and_run_pbdagcon
  install -Dm644 *.py $pkgdir/usr/share/$pkgname

  cd $pkgdir/usr/bin

  ln -s DBG2OLC_Linux DBG2OLC
  ln -s DBG2OLC_Linux dbg2olc
}
