# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=kaa-metadata
pkgver=0.7.8+47+03137959
pkgrel=1
pkgdesc="KAA metadata package"
url="http://freevo.sourceforge.net/"
license=('GPL2')
depends=('libdvdread' 'python2' 'kaa-base')
makedepends=('git')
arch=('i686' 'x86_64')
source=("${pkgname}::git+https://github.com/freevo/kaa-metadata")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "$( grep -m1 VERSION setup.py  | sed "s:.*'\([^']*\)'.*:\1:" )+$(( $( git rev-list --all | grep -B9999  `git rev-list --tags --max-count=1` | wc -l ) - 1))+$( git rev-list --all | head -1 | cut -c1-8 )"
}

package() {
  cd "${srcdir}/${pkgname}"

  # python2 fix
  find . -name '*.py' -exec \
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_;s_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' '{}' \;

  python2 setup.py install --prefix="${pkgdir}"/usr --optimize=1

  # rename executable, conflicts with mmpython FS#14601
  mv "${pkgdir}"/usr/bin/mminfo "${pkgdir}"/usr/bin/kaa-mminfo
}
