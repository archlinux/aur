# Maintainer: b00rt00s <b00rt00s.aur@gmail.com>
# Contributor: Markus Theil <aur@thillux.de>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Jason Taylor <jftaylor21@gmail.com>
# Contributor: Christophe Gueret <tolgam@homegnu.net>
pkgname=blt-git
pkgver=r1535.d7a32cd
pkgrel=1
pkgdesc="Adds new commands and widgets to the Tcl interpreter."
url="http://blt.sourceforge.net"
license=("custom")
depends=('tk' 'libxpm' 'libxrandr' 'libtiff' 'libjpeg-turbo' 'libssh2' 'libmariadbclient' 'sqlite')
makedepends=('git')
conflicts=('blt_tcl85' 'blt')
arch=('i686' 'x86_64')
source=("${pkgname}::git+git://git.code.sf.net/p/blt/src")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
  make CFLAGS="$CFLAGS" CXXFLAGS="$XXCFLAGS"
}

package() {
  # Fix for the man directory
  mkdir -p ${pkgdir}/usr/share/man

  # Add license
  # mkdir -p ${pkgdir}/usr/share/licenses/blt
  # cp ${srcdir}/COPYING ${pkgdir}/usr/share/licenses/blt

  cd ${srcdir}/${pkgname}
  
  #some Makefile's are broken, fixing

  sed -i 's/bltConfig.sh \$(libdir)/bltConfig.sh \$(DESTDIR)\$(libdir)/' Makefile

  for file in library/dd_protocols/Makefile library/palettes/Makefile; do
    sed -i 's/\$\$i \$(destdir)/\$\$i \$(DESTDIR)\$(destdir)/' "${file}"
  done

  #installing
  make DESTDIR=${pkgdir} install

  # Delete man file, it is still owned by extra/tk
  rm ${pkgdir}/usr/share/man/mann/bitmap.n
  rm ${pkgdir}/usr/share/man/mann/busy.n
}
