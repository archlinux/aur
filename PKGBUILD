# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=disper
pkgver=0.3.1
pkgrel=1
pkgdesc="An on-the-fly display switch utility, intended to be used on laptops, especially with nVidia cards."
arch=('any')
url="http://willem.engen.nl/projects/disper/"
license=('GPL')
depends=('python2')
source=(http://ppa.launchpad.net/disper-dev/ppa/ubuntu/pool/main/d/disper/disper_${pkgver}.tar.gz)
md5sums=('4474f6c98078cfab24f49db744eb1e80')
sha256sums=('7cefe3b9837f304bca6a6622081cf91ecfb23307d5934216d32a12eb2ecb0bd1')

build() {
  cd "$srcdir/disper"

  # Patch to use python2
  sed -i -e 's|`src/disper.py|`python2 src/disper.py|' Makefile

  # Patch PREFIX
  sed -i -e 's|PREFIX =.*|PREFIX = /usr|' Makefile

  make
}

package() {
  cd "$srcdir/disper"
  make DESTDIR="$pkgdir" install

  # Patch to use python2
  find "$pkgdir" -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    \{\} +
}
