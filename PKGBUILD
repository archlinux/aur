# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Co-maintainer: Alex Peyser <peyser.alex.public@gmail.com>
pkgname=disper
pkgver=0.3.1.1
pkgrel=1
pkgdesc="An on-the-fly display switch utility, intended to be used on laptops, especially with nVidia cards."
arch=('any')
url="https://github.com/apeyser/${pkgname}"
license=('GPL')
depends=('python2')
source=(${url}/archive/${pkgname}-${pkgver}.tar.gz)
#source=(http://ppa.launchpad.net/disper-dev/ppa/ubuntu/pool/main/d/disper/disper_${pkgver}.tar.gz disper_0.3.1-fix_init.patch )
md5sums=('89cd0998b463dbd13e3c4571966d0153')
sha256sums=('355b5e55ccc377531753f716402128370e0bca690b77be7b867ff199dcbd8853')

build() {
  cd "$srcdir/${pkgname}-${pkgname}-${pkgver}"

  # Patch to use python2
  sed -i -e 's|`src/disper.py|`python2 src/disper.py|' Makefile

  # Patch PREFIX
  sed -i -e 's|PREFIX =.*|PREFIX = /usr|' Makefile

  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  # Patch to use python2
  find "$pkgdir" -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    \{\} +
}
