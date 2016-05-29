# Maintainer: Simon Doppler (dopsi) <dop.simon_at_gmail.com>
pkgname=maxwell2d
pkgver=0.6.4
pkgrel=2
pkgdesc="Electromagnetic waves animations"
arch=('i686' 'x86_64')
url="http://www.met.rdg.ac.uk/clouds/maxwell/"
license=("GPL2")
depends=('netcdf')
md5sums=('4e3a420397bb83f5b5ff4615c4714e60' '87eaefe1aed8f0b2fcd78c47907198bc')
source=('http://www.met.rdg.ac.uk/clouds/maxwell/maxwell2d-0.6.4.tar.gz' 'maxwell2d_create_gif.sh')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/giflib-4.1.6
  ./configure
  make
  cd ${srcdir}/${pkgname}-${pkgver}/src
  sed -i -e 's_-I/usr/include/netcdf-3__g' Makefile
  sed -i -e 's/--static //g' Makefile
  make all
  cd ${srcdir}/${pkgname}-${pkgver}/examples
  sed -i -e 's|../src/maxwell_nc|maxwell2d_nc|g' create_examples.sh
  sed -i -e 's|../src/maxwell_gif|maxwell2d_gif|g' create_examples.sh
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/share/maxwell2d/examples
  mkdir -p $pkgdir/usr/share/maxwell2d/default
  install -m 755 maxwell2d_create_gif.sh $pkgdir/usr/bin
  cd ${srcdir}/${pkgname}-${pkgver}
  install -m 755 examples/*.cfg $pkgdir/usr/share/maxwell2d/examples
  install -m 755 examples/default/*.cfg $pkgdir/usr/share/maxwell2d/default
  install -m 755 src/maxwell2d_nc $pkgdir/usr/bin
  install -m 755 src/maxwell2d_gif $pkgdir/usr/bin
  install -m 755 giflib-4.1.6/lib/.libs/libgif.so.4.1.6 $pkgdir/usr/lib
  ln -s libgif.so.4.1.6 $pkgdir/usr/lib/libgif.so.4

}
