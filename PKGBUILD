# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=gv
pkgver=3.7.3
pkgrel=1
pkgdesc="A program to view PostScript and PDF documents"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gv/"
license=('GPL')
depends=('xaw3d>=1.6' 'ghostscript' 'desktop-file-utils')
install=gv.install
source=(http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz gv.desktop gv.png
        buildfix.diff)
md5sums=('98ae3e9ce338b64ba5ab622389c5960e'
         'cf04652952f2d0903bc7578b4826f50c'
         'ab0e3879dbe39e59ad1c923020c28a86'
         '943baf7a6bb61389a09a4ec71083a900')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # https://trac.macports.org/browser/trunk/dports/print/gv/files/patch-src-Scrollbar.c.diff?rev=89338
  patch -Np0 -i ${srcdir}/buildfix.diff
  sed -i -e "s:-dGraphicsAlphaBits=2:\0 -dAlignToPixels=0:" src/Makefile.{am,in}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 ../gv.desktop "${pkgdir}/usr/share/applications/gv.desktop"
  install -D -m644 ../gv.png "${pkgdir}/usr/share/pixmaps/gv.png"
}
