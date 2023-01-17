# Maintainer: Luis Sarmiento <lgsarmientop-ala-unal.edu.co>

pkgname=dawn
_PKGNAME=Dawn
pkgver=3.91a
_pkgver=3_91a
pkgrel=5
pkgdesc="3D geometrical postscript renderer"
url="http://geant4.kek.jp/~tanaka/DAWN/About_DAWN.html"
license=("unknown")
arch=('i686' 'x86_64')
makedepends=('texlive-core')
depends=('tcsh' 'tk' 'libx11' 'gv')

source=("http://geant4.kek.jp/~tanaka/src/${pkgname}_${_pkgver}.tgz"
	"${pkgname}-${pkgver}-no-interactive.patch"
	"make_DESTDIR.patch"
       )
sha256sums=('81d855ead1117681b188242dd0be3a24e005d9bd4063fd2bda9a7a794ebcf5f4'
            '4265d3109a2802e559194f79960d32326c92cb3ffb9a54a42cb7a13f132f8db4'
            'f6afa9f21dc27f8d6bb55fa58829f805c082657c9ea7dba8aae1d39a81074ca6')

prepare(){
  cd $srcdir/${pkgname}_${_pkgver}
  patch -Np2 < ${srcdir}/${pkgname}-${pkgver}-no-interactive.patch
  sed -i -e '/strip/d' Makefile*in

}

build () {
  cd $srcdir/${pkgname}_${_pkgver}
  make clean && make guiclean
  ./configure
  make
}

package() {
  cd $srcdir/${pkgname}_${_pkgver}
  patch -Np2 < ${srcdir}/make_DESTDIR.patch
  [ -d ${pkgdir}/usr/bin ] || install -d ${pkgdir}/usr/bin
  make DESTDIR=${pkgdir} install

  DOCDIR=usr/share/doc/${pkgname}
  [ -d ${pkgdir}/${DOCDIR} ] || install -d ${pkgdir}/${DOCDIR}
  cd ${srcdir}/${pkgname}_${_pkgver}
  pdflatex DOC/G4PRIM_FORMAT_24.tex
  install -m644 DOC/*.pdf   ${pkgdir}/${DOCDIR}
  install -m644 DOC/*.html  ${pkgdir}/${DOCDIR}

  echo "
	[Desktop Entry]
	Name=${_PKGNAME}
	Comment=${pkgdesc}
	Exec=${pkgname}
	Icon=xchm-32
	Terminal=false
	Type=Application
	Categories=Utility;Science;
	StartupNotify=false
	" > $srcdir/$pkgname.desktop
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
