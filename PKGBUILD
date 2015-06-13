# Maintainer: Aetf <aetf at unlimitedcodeworks dot xyz>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Peng Zhang <pczhang@gmail.com>

pkgname=alglib
pkgver=3.9.0
pkgrel=1
pkgdesc="A cross-platform numerical analysis and data processing library (third version). Free Version"
arch=('i686' 'x86_64')
url="http://www.alglib.net"
license=('GPL2')
#depends=('gmp' 'mpfr')
options=('!staticlibs')
source=("http://www.alglib.net/translator/re/alglib-${pkgver}.cpp.gpl.zip")
md5sums=('376310094f0f5ab35962920b6f4a0bf3')

build() {
  cd ${srcdir}/cpp/src

  # make static lib
  gcc -I. -c *.cpp
  ar rcs libalglib.a *.o

  # make shared lib
  rm -f *.o
  gcc -I. -fPIC -c *.cpp
  gcc -shared -Wl,-soname,libalglib.so.3 -o libalglib.so.${pkgver} *.o
}

package() {
  cd ${srcdir}/cpp/src

  # install docs
  install -d ${pkgdir}/usr/share/doc/alglib
  install ../manual.cpp.html ${pkgdir}/usr/share/doc/alglib

  # install headers
  install -d ${pkgdir}/usr/include/libalglib
  install *.h ${pkgdir}/usr/include/libalglib

  # install library
  install -d ${pkgdir}/usr/lib
  install libalglib.a ${pkgdir}/usr/lib
  install libalglib.so.${pkgver} ${pkgdir}/usr/lib
  ln -s libalglib.so.${pkgver} ${pkgdir}/usr/lib/libalglib.so.3
  ln -s libalglib.so.${pkgver} ${pkgdir}/usr/lib/libalglib.so
}
