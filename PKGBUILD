# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: jsteel <jsteel at vorx dot com>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=fdclone
pkgver=3.01h
pkgrel=1
pkgdesc="Ncurses file and directory management tool"
arch=('i686' 'x86_64')
url="http://hp.vector.co.jp/authors/VA012337/soft/fd/"
license=('custom')
depends=('ncurses')
makedepends=('sed')
optdepends=(unzip lha p7zip tar)
conflicts=('fd')
backup=("etc/$pkgname/fd2rc")
options=(!emptydirs)
source=(http://www.unixusers.net/src/fdclone/FD-$pkgver.tar.gz)
sha256sums=('24be8af52faa48cd6f123d55cfca45d21e5fd1dc16bed24f6686497429f3e2cf')
_pkgname=$(echo ${pkgname^^} | sed 's/CLONE//g')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  echo '#define _NOJPNMES' >> config.hin
  echo '#define USEDATADIR' >> config.hin
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  make PREFIX=${pkgdir}/usr CONFDIR=/etc/$_pkgname everything
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make\
    PREFIX=$pkgdir/usr\
    MANTOP=$pkgdir/usr/share/man\
    JMANDIR=$pkgdir/usr/share/man/ja/man1\
    DESTDIR="$pkgdir/"\
   install
  install -m755 ./fd{,b,n}sh "$pkgdir"/usr/bin
  install -DTm644 ./LICENSES.eng "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
  install -d "$pkgdir/etc/$_pkgname"
  install -d "$pkgdir/usr/share/doc/$_pkgname"
  cp -r FAQ* README* TECHKNOW* ToAdmin* $pkgdir/usr/share/doc/$_pkgname/

  # Update the config file
  sed	-e '/^#DISPLAYMODE=/{s/^#//;s/0/6/;}' \
	-e '/^#ANSICOLOR=/{s/^#//;s/0/1/}' \
	-e '/^#LANGUAGE=/{s/^#//;s/""/en/}' \
	-e '/^#SORTTYPE=/{s/^#//;s/0/1/}' \
	_fdrc > "$pkgdir/etc/$_pkgname/fd2rc"
}
