# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: riai <riai@bigfoot.com>, Ben <ben@benmazer.net>

pkgbase=sip418
pkgname=('sip418' 'python-sip418' 'python2-sip418')
pkgver=4.18.1
pkgrel=2
arch=('i686' 'x86_64')
url='http://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
makedepends=('python' 'python2')
source=("http://sourceforge.net/projects/pyqt/files/sip/sip-$pkgver/sip-$pkgver.tar.gz")
md5sums=('9d664c33e8d0eabf1238a7ff44a399e9')

prepare() {
  cp -a sip-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/sip-$pkgver
  python configure.py CFLAGS="$CFLAGS" LFLAGS="$LDFLAGS"
  make

  cd "$srcdir"/sip-$pkgver-py2
  python2 configure.py CFLAGS="$CFLAGS" LFLAGS="$LDFLAGS"
  make
}

package_sip418() {
  pkgdesc="A tool that makes it easy to create Python bindings for C and C++ libraries (the last version compatible with qt3)"
  depends=('glibc')

  cd sip-$pkgver
  make DESTDIR="$pkgdir" install -C sipgen
  mv "${pkgdir}/usr/bin/sip" "${pkgdir}/usr/bin/sip418"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}-418/LICENSE
}

package_python-sip418() {
  pkgdesc="Python 3.x SIP bindings for C and C++ libraries (the last version compatible with qt3)"
  depends=('sip' 'python')

  cd sip-$pkgver
  make DESTDIR="$pkgdir" install -C siplib

  install -Dm644 sipconfig.py "$pkgdir"/usr/lib/python3.5/site-packages/sipconfig418/sipconfig.py
  install -Dm644 sipdistutils.py "$pkgdir"/usr/lib/python3.5/site-packages/sipconfig418/sipdistutils.py

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}-418/LICENSE

  install -d "${pkgdir}/usr/lib/python3.8/site-packages/sip418" \
             "${pkgdir}/usr/include/python3.8/sip418"
  mv "${pkgdir}/usr/lib/python3.8/site-packages/sip.so" "${pkgdir}/usr/lib/python3.8/site-packages/sip418/sip.so"
  mv "${pkgdir}/usr/lib/python3.8/site-packages/sip.pyi" "${pkgdir}/usr/lib/python3.8/site-packages/sip418/sip.pyi"
  mv "${pkgdir}/usr/include/python3.8/sip.h" "${pkgdir}/usr/include/python3.8/sip418/sip.h"
}

package_python2-sip418() {
  pkgdesc="Python 2.x SIP bindings for C and C++ libraries (the last version compatible with qt3)"
  depends=('sip' 'python2')

  cd sip-$pkgver-py2
  make DESTDIR="$pkgdir" install -C siplib

  install -Dm644 sipconfig.py "$pkgdir"/usr/lib/python2.7/site-packages/sipconfig418/sipconfig.py
  install -Dm644 sipdistutils.py "$pkgdir"/usr/lib/python2.7/site-packages/sipconfig418/sipdistutils.py

  install -d "${pkgdir}/usr/lib/python2.7/site-packages/sip418" \
             "${pkgdir}/usr/include/python2.7/sip418"
  mv "${pkgdir}/usr/lib/python2.7/site-packages/sip.so" "${pkgdir}/usr/lib/python2.7/site-packages/sip418/sip.so"
  mv "${pkgdir}/usr/lib/python2.7/site-packages/sip.pyi" "${pkgdir}/usr/lib/python2.7/site-packages/sip418/sip.pyi"
  mv "${pkgdir}/usr/include/python2.7/sip.h" "${pkgdir}/usr/include/python2.7/sip418/sip.h"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}-418/LICENSE
}
