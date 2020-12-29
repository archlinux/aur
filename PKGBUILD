# Maintainer: Simon  Klemenc <simon.klemenc@gmail.com>
# Contributor: Jesse van Rhijn <jesse.v.rhijn@gmail.com>
# Contributor: pfm <vorticity@mail.ru>

pkgname=xfoil
pkgver=6.99
pkgrel=3
pkgdesc="Program for design and analysis of subsonic airfoils."
arch=('i686' 'x86_64')
url="http://web.mit.edu/drela/Public/web/xfoil/"
license=('GPL2')
depends=('gcc-libs' 'libx11')
makedepends=('gcc-fortran')
source=("http://web.mit.edu/drela/Public/web/xfoil/$pkgname$pkgver.tgz"
        "xfoil-fix-write-after-end.patch"
        "xfoil-overflow.patch"
        "xfoil-osmap.patch"
        "xfoil-build.patch")
        
build() {
  cd "$srcdir/Xfoil"

  patch -Np1 -i ../xfoil-fix-write-after-end.patch
  patch -Np1 -i ../xfoil-overflow.patch
  patch -Np1 -i ../xfoil-osmap.patch
  patch -Np1 -i ../xfoil-build.patch

  cd "$srcdir/Xfoil/orrs/bin"
  make -f Makefile_DP FTNLIB="${LDFLAGS}" OS
  cd "$srcdir/Xfoil/orrs"
  bin/osgen osmaps_ns.lst 

  cd "$srcdir/Xfoil/plotlib"
  make CFLAGS="${CFLAGS} -DUNDERSCORE"
     
  cd "$srcdir/Xfoil/bin"
  make -f Makefile_gfortran \
          CFLAGS="${CFLAGS} -DUNDERSCORE" \
          FTNLIB="${LDFLAGS}"
}

package() {
  install -m755 -d ${pkgdir}/usr/bin
  install -m755 -d ${pkgdir}/usr/share/xfoil/{doc,orrs}

  install -m755 ${srcdir}/Xfoil/bin/{xfoil,pplot,pxplot} \
                ${pkgdir}/usr/bin
  
  install -m644 ${srcdir}/Xfoil/orrs/osmap.dat \
                ${pkgdir}/usr/share/xfoil/orrs
  install -m644 ${srcdir}/Xfoil/xfoil_doc.txt \
                ${pkgdir}/usr/share/xfoil/doc
}
md5sums=('8d6270fc4341d299a426b3ad41be9cc4'
         '818090412424024b464d8e3afee5732e'
         'f5f7d8cb268bf44546464636635109bc'
         'a4ad193f796e9de52596057d03e5b703'
         '93a7a7d020a38488990d74fd762ed5de')
