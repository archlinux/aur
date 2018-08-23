# Maintainer: Thomas Jost <schnouki@schnouki.net>
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
md5sums=('223d1c7d6aed9fefa86a864ebef99ea0')
sha256sums=('e73b3e5ec2e58da78864cf5ac7283c8c07083295e8edaf341fcf934f820a724b')

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
