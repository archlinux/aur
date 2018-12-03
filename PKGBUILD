# http://rec.arts.int-fiction.narkive.com/pM8Kgfbw/confusion-just-enough-mdl

pkgname=zork
pkgver=0
pkgrel=4
pkgdesc="MDL Zork!"
arch=('any')
license=('none')
depends=('confusion' 'unzip')
source=('https://web.archive.org/web/20060618164309/http://simh.trailing-edge.com/games/zork-mdl.zip'
	'https://web.archive.org/web/20140926035425/https://www.ifarchive.org/if-archive/programming/mdl/interpreters/confusion/confusion_mdlzork.tgz'
	'https://web.archive.org/web/20170801114137/http://eris.club/pit/madadv.diff')
noextract=('zork-mdl.zip')
md5sums=('7aa4b442c3e0a156b9517868a05231a4'
	 'f159bc65e1d12463981af5bd934cbb2f'
	 '08e37dc12377f230cc37e1e3b1f7a601')

package() {
  cd $srcdir

  unzip zork-mdl.zip -d zrc
  patch -d zrc < confusion_mdlzork.diff
  mkdir zrc/MTRZORK
  mkdir zrc/MDL
  patch -d zrc/MDL < ../madadv.diff
  install -dm755 $pkgdir/usr/share/mdl-zork
  cp -r zrc/* $pkgdir/usr/share/mdl-zork

# required for save & restore 
  chmod -R 777 $pkgdir/usr/share/mdl-zork/MTRZORK

  echo '#!/bin/sh' > $pkgname
  echo 'cd /usr/share/mdl-zork' >> $pkgname
  echo 'mdli -r MDL/MADADV.SAVE' >> $pkgname
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
