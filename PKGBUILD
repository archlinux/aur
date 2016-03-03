# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: jsteel <jsteel at vorx dot com>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=fd
pkgver=3.01b
pkgrel=5
pkgdesc="Ncurses file and directory management tool"
arch=('i686' 'x86_64')
url="http://hp.vector.co.jp/authors/VA012337/soft/fd/"
license=('custom')
depends=('ncurses')
makedepends=('sed')
optdepends=(unzip lha p7zip tar)
backup=("etc/$pkgname/fd2rc")
options=(!emptydirs)
source=(http://hp.vector.co.jp/authors/VA012337/soft/fd/FD-$pkgver.tar.gz)
md5sums=('3c3668bef7924e689943a2cca5ff414d')

prepare() {
  cd $srcdir/${pkgname^^}-$pkgver
  echo '#define _NOJPNMES' >> config.hin
  echo '#define USEDATADIR' >> config.hin
}

build() {
  cd $srcdir/${pkgname^^}-$pkgver
  make PREFIX=${pkgdir}/usr CONFDIR=/etc/$pkgname everything
}

package() {
  cd $srcdir/${pkgname^^}-$pkgver
  make\
    PREFIX=$pkgdir/usr\
    MANTOP=$pkgdir/usr/share/man\
    JMANDIR=$pkgdir/usr/share/man/ja/man1\
    DESTDIR="$pkgdir/"\
   install
  install -m755 ./fd{,b,n}sh "$pkgdir"/usr/bin
  install -DTm644 ./LICENSES.eng "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -d "$pkgdir/etc/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r FAQ* README* TECHKNOW* ToAdmin* $pkgdir/usr/share/doc/$pkgname/

  # Update the config file
  sed	-e '/^#DISPLAYMODE=/{s/^#//;s/0/6/;}' \
	-e '/^#ANSICOLOR=/{s/^#//;s/0/1/}' \
	-e '/^#LANGUAGE=/{s/^#//;s/""/en/}' \
	-e '/^#SORTTYPE=/{s/^#//;s/0/1/}' \
	_fdrc > "$pkgdir/etc/$pkgname/fd2rc"
}
