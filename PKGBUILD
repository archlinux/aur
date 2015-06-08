# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=icon  
pkgver=951
pkgrel=2
pkgdesc="The Icon programming language"
url="http://www.cs.arizona.edu/icon/"
arch=('i686' 'x86_64')
depends=('sh' 'libx11')
license=('custom')
source=(http://www.cs.arizona.edu/icon/ftp/packages/unix/icon-v${pkgver}src.tgz LICENSE)
md5sums=('8fdeb7c5408d9d9bf06bc5e7f4f54498'
         '46e837548bf46e5b0db662322650eb4f')
build() {
  cd $srcdir/$pkgname-v${pkgver}src
  make X-Configure name=linux 
  make -j1
}

package() {
  cd $srcdir/$pkgname-v${pkgver}src
  install -d $pkgdir/usr/share 
  make Install dest=$pkgdir/usr/share/icon 
  for _i in colrbook colrpick fontpick icont iconx palette vib wevents 
  do
    install -D -m755 $pkgdir/usr/share/icon/bin/$_i $pkgdir/usr/bin/$_i 
    rm $pkgdir/usr/share/icon/bin/$_i
  done
  cd $pkgdir/usr/share/icon/bin
  rm icon
  install -D -m644 $pkgdir/usr/share/icon/bin/libcfunc.so \
    $pkgdir/usr/lib/libcfunc.so
  rm $pkgdir/usr/share/icon/bin/libcfunc.so
  rm -fr $pkgdir/usr/share/icon/bin
  for _i in icont icon
  do
    install -D -m644 $pkgdir/usr/share/icon/man/man1/$_i.1 \
	    $pkgdir/usr/share/man/man1/$_i.1
    rm $pkgdir/usr/share/icon/man/man1/$_i.1
  done
  rmdir $pkgdir/usr/share/icon/man/man1/
  rmdir $pkgdir/usr/share/icon/man
  cd $pkgdir/usr/bin
  ln -s icont icon
  install -D -m644 $srcdir/LICENSE \
    $pkgdir/usr/share/licenses/icon/LICENSE
}
