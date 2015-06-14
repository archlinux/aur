# Maintainer: Luis Sarmiento <lgsarmientop-ala-unal.edu.co>

pkgname=dawn
_PKGNAME=Dawn
pkgver=3.90b
_pkgver=3_90b
pkgrel=3
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

md5sums=('3017f35db5c1ba7f7e95bff6f2d8bd46'
         '7bb06c81f2f1ac5475939a40dd7cbc80'
         '4128a7eb7ea6395e754cc3a02259425e')

build () {
	cd $srcdir/${pkgname}_${_pkgver}	
	patch -Np2 < ${srcdir}/${pkgname}-${pkgver}-no-interactive.patch
	sed -i -e '/strip/d' Makefile*in
	
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
