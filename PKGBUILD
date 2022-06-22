# Maintainer: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
pkgname=tv
pkgver=1.9.13
pkgrel=7
pkgdesc="Spectra- and matrix-analysis program developed at IKP, Köln, Germany"
url="https://www.ikp.uni-koeln.de/~fitz/viewspectra/Tv_user-manual/Tv_user-manual.html"
arch=('x86_64' 'i686')
license=('custom') # https://www.ikp.uni-koeln.de/~fitz/viewspectra/Tv_user-manual/node229.html#SECTION001500000000000000000
depends=('libmfile' 'xaw3d')
makedepends=('latex2html'
             'texlive-latexextra'
)
options=('!emptydirs')

source=("https://web.archive.org/web/20110707105717/http://www.ikp.uni-koeln.de/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('5b739a811abe604cbe4160e4402796dc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/doc/tex/Manual
  make all html
}

package() {

  [ -d ${pkgdir}/usr/share/X11/app-defaults ] || install -d ${pkgdir}/usr/share/X11/app-defaults
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-appdefaultdir=${pkgdir}/usr/share/X11/app-defaults
  make DESTDIR=${pkgdir} install

  [ -d ${pkgdir}/usr/share/doc/${pkgname} ] || install -d ${pkgdir}/usr/share/doc/${pkgname}
  cp -r  ${srcdir}/${pkgname}-${pkgver}/doc/tex/Manual/Tv_user-manual ${pkgdir}/usr/share/doc/${pkgname}/
  install -Dm644 $srcdir/${pkgname}-${pkgver}/doc/tex/Manual/Tv_user-manual.ps.gz ${pkgdir}/usr/share/doc/${pkgname}/

  ## remove WARNING: Package contains reference to $srcdir
  rm ${pkgdir}/usr/share/doc/tv/Tv_user-manual/images.log
}
