# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=unidata-decoders
pkgver=5.0.1
pkgrel=1
pkgdesc="Unidata various data format decoders"
url="http://www.unidata.ucar.edu/software/decoders"
license="custom"
arch=(i686 x86_64)
depends=(netcdf udunits)
makedepends=(gcc)
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(ftp://ftp.unidata.ucar.edu/pub/decoders/decoders-$pkgver.tar.gz paths.patch)
md5sums=('52af852784986fea2454ffbd25d788ef'
         '250ea5e3976cce836e682f11c89ab7e0')

build() {
  cd $srcdir/decoders-$pkgver/src
  patch -Np2 -i $srcdir/paths.patch || exit 1
  ./configure --prefix=/usr --sysconfdir=/usr/share/$pkgname
  make || return 1
}

package() {
  cd $srcdir/decoders-$pkgver/src
  make exec-prefix=$pkgdir/usr prefix=$pkgdir/usr \
       DESTDIR=$pkgdir ETCDIR=$pkgdir/usr/share/$pkgname \
       MANDIR=$pkgdir/usr/share/man BINDIR=$pkgdir/usr/bin \
       install || return 1
  find $pkgdir -type d -exec chmod -s {} \;
  find $pkgdir -type d -exec chmod 755 {} \;
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install $srcdir/decoders-$pkgver/src/COPYRIGHT \
          $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
