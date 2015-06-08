# Maintainer: Markus Theil <aur@thillux.de>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Jason Taylor <jftaylor21@gmail.com>
# Contributor: Christophe Gueret <tolgam@homegnu.net>
# Contributor: b00rt00s <b_ged@linuksowo.pl>
pkgname=blt
pkgver=2.4z
pkgrel=11
pkgdesc="Adds new commands and widgets to the Tcl interpreter."
url="http://blt.sourceforge.net"
license="custom"
depends=('tk')
makedepends=('git')
arch=('i686' 'x86_64')
source=('git+https://github.com/thillux/blt.git'
       COPYING)
md5sums=('SKIP'
         '49ab6c4bd72e045108c92d839368df04')
_gitname=blt

build() {
  # configure
  cd ${srcdir}/${pkgname}

  ./configure \
    --prefix=/usr \
    --with-tcl=/usr/lib \
    --with-x --x-includes=/usr/include \
    --x-libraries=/usr/lib \
    --mandir=/usr/share/man

  # Compile
  make -j 1 || return 1
}

package() {
  # Fix for the man directory
  mkdir -p ${pkgdir}/usr/share/man

  # Add license
  mkdir -p ${pkgdir}/usr/share/licenses/blt
  cp ${srcdir}/COPYING ${pkgdir}/usr/share/licenses/blt

  cd ${srcdir}/${pkgname}
  make -j 1 INSTALL_ROOT=${pkgdir} install

  # Delete man file, it is still owned by extra/tk
  rm ${pkgdir}/usr/share/man/mann/bitmap.n
  rm ${pkgdir}/usr/share/man/mann/busy.n
}
