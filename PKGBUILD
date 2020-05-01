# Maintainer: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=gimp-refocus
pkgver=0.9.0
pkgrel=5
pkgdesc="A sharpen plugin for gimp using FIR Wiener filtering"
arch=('x86_64')
url="http://refocus.sourceforge.net/"
license=('GPL2')
depends=('gimp')
source=(https://downloads.sourceforge.net/sourceforge/refocus/refocus-${pkgver}.tar.gz \
        refocus-gimp-2.0.patch refocus-mirror-fix.patch refocus-gimp-preview.patch)
md5sums=('8d4eac4ef45c904fb5e73021696bec94'
         '1b7bc13154f483994af3846c7ee29ad7'
         '532593cba030feab8ffa7800fc9cd782'
         '5dcf118f8dee7a32ca35f932ff9b2e3c')

build() {
  cd "${srcdir}/refocus-${pkgver}"
  patch -Np0 -i ../refocus-gimp-2.0.patch
  patch -Np0 -i ../refocus-mirror-fix.patch
  patch -Np0 -i ../refocus-gimp-preview.patch
  aclocal
  autoconf
  automake --add-missing
  ./configure --prefix=/usr --bindir=/usr/lib/gimp/2.0/plug-ins
  sed -i '/^CFLAGS =/s/$/ -std=c99/' src/Makefile
  make
}

package() {
  cd "${srcdir}/refocus-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
