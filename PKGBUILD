# Maintainer: awe00 < awe00 AT hotmail DOT fr>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Manolis Tzanidakis <manolis@archlinux.org>
# Contributor: Esa Määttä <esa.maatta_at_iki.fi>

pkgname=getmail-passwordeval
pkgver=4.53.0
pkgrel=1
pkgdesc="A POP3 mail retriever with reliable Maildir and command delivery (with passwordeval patch)."
arch=(any)
url="http://pyropus.ca/software/getmail"
license=("GPL")
depends=('python2')
provides=('getmail')
conflicts=('getmail')
optdepends=('python2-gnomekeyring: for storing passwords in gnome-keyring')
# no signature, no https
source=("http://pyropus.ca/software/getmail/old-versions/getmail-$pkgver.tar.gz"
        "0001-Added-passwordeval-option-and-documentation.patch")
sha256sums=('282596fe33b5a24b3aefe5b268f57efbcdd5b980478901418045b481636f92ab'
            '0bdaaa3f2ada33b32b5861eef71a5290d478a67b7cda90e2aadc598876dda7ad')

prepare() {
  cd getmail-${pkgver}
  # fix broken shebang calls
  sed -i -e "s|#![ ]*/usr/bin/env python|#!/usr/bin/env python2|" getmailcore/__init__.py
  sed -i -e "s|#![ ]*/usr/bin/env python2.3|#!/usr/bin/env python2|" $(find . -name '*.py')
  # recheck
  head -1 $(find . -name '*.py')

  patch -Np1 -i "${srcdir}/0001-Added-passwordeval-option-and-documentation.patch"
}

build() {
  cd getmail-${pkgver}
  python2 setup.py build
}

package() {
  cd getmail-${pkgver}
  python2 setup.py install --root=${pkgdir}
}

