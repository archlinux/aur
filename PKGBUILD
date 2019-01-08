# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=kulic
pkgver=1.1
pkgrel=5
pkgdesc="2d shooting game"
url='http://hippo.nipax.cz/download.cz.php?id=59'
arch=('i686' 'x86_64')
license=('GPL-2')
depends=('allegro4' 'libjpeg')
source=("http://hippo.nipax.cz/src/${pkgname}-${pkgver}.tar.gz" "allegro_aliases.patch")
md5sums=('16aff4bded3ae1c6712ca71d4d429730'
         '9671a62c0cab0b0b2e5106f80b43a921')

prepare() {
  cd $srcdir/${pkgname}-${pkgver}
  patch -p0 -i $srcdir/allegro_aliases.patch
  mv configure.in configure.ac
}

build() {
  cd $srcdir/${pkgname}-${pkgver}
  aclocal
  automake --add-missing
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/bin/kulic $pkgdir/usr/share/kulic
  ( echo "#!/bin/bash
cd /usr/share/kulic
padsp ./kulic" ) > $pkgdir/usr/bin/kulic
  chmod 755 $pkgdir/usr/bin/kulic
  cd misc
  install -D -m644 kulic.6 $pkgdir/usr/share/man/man6/kulic.6
  install -D -m644 kulic.xpm $pkgdir/usr/share/pixmaps/kulic.xpm
  install -D -m644 kulic.desktop $pkgdir/usr/share/applications/kulic.desktop
}
