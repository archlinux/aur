# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: jsteel <jsteel at vorx dot com>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=fd
pkgver=3.01b
pkgrel=1
pkgdesc="Ncurses file and directory management tool"
arch=('i686' 'x86_64')
url="http://hp.vector.co.jp/authors/VA012337/soft/fd/"
license=('custom')
depends=('ncurses')
makedepends=('sed')
optdepends=(unzip lha p7zip tar)
backup=etc/$pkgname/fd2rc
options=(!emptydirs)
source=(http://hp.vector.co.jp/authors/VA012337/soft/fd/FD-$pkgver.tar.gz
'LICENSE')
md5sums=('3c3668bef7924e689943a2cca5ff414d'
         '9792276314f0b2a716ce3d5078bf2e13')

build() {
 cd $srcdir/${pkgname^^}-$pkgver
 make PREFIX=${pkgdir}/usr CONFDIR=/etc/$pkgname bsh
}

package() {
  cd "$srcdir/${pkgname^^}-${pkgver}"
  make PREFIX=${pkgdir}/usr DESTDIR="$pkgdir/" \
       MANTOP=${pkgdir}/usr/share/man \
       JMANDIR=${pkgdir}/usr/share/man/ja/man1 \
       install

  install -D -T -m644 "${srcdir}"/LICENSE /${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -d "${pkgdir}/etc/${pkgname}"
  install -d "${pkgdir}"/usr/{share/man/man1,bin,share/licenses/${pkgname}}  
  install -m755 ./fdbsh "${pkgdir}"/usr/bin/
  
  # config
  sed	-e '/^#DISPLAYMODE=/{s/^#//;s/0/6/;}' \
	-e '/^#ANSICOLOR=/{s/^#//;s/0/1/}' \
	-e '/^#LANGUAGE=/{s/^#//;s/""/en/}' \
	-e '/^#SORTTYPE=/{s/^#//;s/0/1/}' \
    _fdrc > "${pkgdir}/etc/${pkgname}/fd2rc"
}
