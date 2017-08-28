# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=icon-git
pkgver=23.g8cb4887
pkgrel=1
pkgdesc="The Icon programming language"
arch=('i686' 'x86_64')
url="http://www.cs.arizona.edu/icon/"
license=('custom')
depends=('sh' 'libx11')
makedepends=('git')
provides=('icon=951')
conflicts=('icon')
source=("git://github.com/gtownsend/icon.git" LICENSE)
md5sums=('SKIP' '46e837548bf46e5b0db662322650eb4f')
_gitname="icon"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git describe --tags | sed 's|-|.|g' |cut -c8-
}

build() {
  cd "$srcdir"/"$_gitname"
  make X-Configure name=linux
  make -j1
}

package() {
  cd "$srcdir/$_gitname"
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
    $pkgdir/usr/share/licenses/icon-git/LICENSE
}
