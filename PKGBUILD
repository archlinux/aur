# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=drobo-utils
_pkgver=0.6.2
pkgver=${_pkgver}.2
pkgrel=3
pkgdesc="A library, GUI and CLI script for managing Data Robotics storage units on Linux"
arch=(any)
url="http://drobo-utils.sourceforge.net/"
license=('GPL3')
depends=('python2' 'python2-pyqt' 'parted')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/r${_pkgver//./_}/${pkgname}-${pkgver}.tgz)
md5sums=('7e181580a9051f4c87b567692d9ec094')
sha1sums=('c6518b49c8304e3cbad7b39d9cfc2b3ab3c7484b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir

  # Patch to use python2
  find $pkgdir -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    \{\} +

  # Install some more stuff
  install -Dm644 drobom.8 $pkgdir/usr/share/man/man8/drobom.8
  install -Dm644 droboview.8 $pkgdir/usr/share/man/man8/droboview.8
  for f in CHANGES.txt DEVELOPERS.txt README.txt; do
    install -Dm644 $f $pkgdir/usr/share/doc/$pkgname/$f
  done
}
