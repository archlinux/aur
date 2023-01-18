#Submitter: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname=dawn-simple
_pkgname=dawn
_PKGNAME=Dawn
pkgver=3.91a
_pkgver=3_91a
pkgrel=3
pkgdesc="3D geometrical postscript renderer"
url="http://geant4.kek.jp/~tanaka/DAWN/About_DAWN.html"
license=("unknown")
arch=('i686' 'x86_64')
makedepends=('texlive-core')
provides=('dawn')
conflicts=('dawn')
depends=('tk' 'libx11')
optdepends=('tcsh' 'gv')
source=(
  "http://geant4.kek.jp/~tanaka/src/${_pkgname}_${_pkgver}.tgz"
  "Makefile.patch"
)
sha256sums=(
  '81d855ead1117681b188242dd0be3a24e005d9bd4063fd2bda9a7a794ebcf5f4'
  '21ef590d659c6900f2286eadeec6b5e49f1c88598faab3d5219a1baa60d7d9b9'
)

prepare(){
  cd $srcdir/${_pkgname}_${_pkgver}
  patch Makefile < ${srcdir}/Makefile.patch

}

build () {
  cd $srcdir/${_pkgname}_${_pkgver}
  make clean && make guiclean
  make
}

package() {
  cd $srcdir/${_pkgname}_${_pkgver}
  [ -d ${pkgdir}/usr/bin ] || install -d ${pkgdir}/usr/bin
  make DESTDIR=${pkgdir} install

  DOCDIR=usr/share/doc/${_pkgname}
  [ -d ${pkgdir}/${DOCDIR} ] || install -d ${pkgdir}/${DOCDIR}
  cd ${srcdir}/${_pkgname}_${_pkgver}
  pdflatex DOC/G4PRIM_FORMAT_24.tex
  install -m644 DOC/*.pdf   ${pkgdir}/${DOCDIR}
  install -m644 DOC/*.html  ${pkgdir}/${DOCDIR}

  echo "
	[Desktop Entry]
	Name=Dawn
	Comment=${pkgdesc}
	Exec=/usr/bin/DAWN_GUI
	Icon=xchm-32
	Terminal=false
	Type=Application1
	Categories=Utility;Science;
	StartupNotify=false
	" > $srcdir/dawn.desktop
  install -Dm644 $srcdir/dawn.desktop $pkgdir/usr/share/applications/dawn.desktop
}
