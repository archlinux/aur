# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=pyneighborhood
pkgver=0.5.4
pkgrel=4
pkgdesc="A GTK+ 2 rewrite of the well-known LinNeighborhood tool"
license=('GPL')
url="https://launchpad.net/pyneighborhood"
source=("https://launchpad.net/pyneighborhood/0.5/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2"{,.asc}
        "pkexec.patch")
depends=('pygtk' 'smbclient')
optdepends=('polkit: mount/unmount Samba shares')
arch=('any')
options=('!emptydirs')
sha1sums=('b0d899230ed0212aa50c17f406b0ee7e3d6ac17a'
          'SKIP'
          'c23d054b2309fcc012f98e7274e6fd2e09d2f9a6')
validpgpkeys=('E188933BBC00723A9DB00CD31398E68B6F33567E') # Stefan J. Betz <info@stefan-betz.net>

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # python2 fix
  for file in $(find . -type f -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  # Use pkexec to mount/unmount Samba shares
  patch -Np1 -i ../pkexec.patch
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make PYTHON=python2 DESTDIR=${pkgdir}/usr install
}
