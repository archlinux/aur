# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=geomspace
pkgver=0.14
pkgrel=1
pkgdesc="A browser for geometric (i.e. Euclidean, Riemann, Minkowski) spaces"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/geomspace/"
license=('GPL')
depends=('mesa' 'fltk')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgver/GeomSpace-$pkgver-src.tar.gz \
	http://downloads.sourceforge.net/project/$pkgname/Theory/UniformGeomSpace-2010.11.02-en.pdf \
	http://sourceforge.net/projects/geomspace/files/Models/5Cubes.gmsp \
	http://sourceforge.net/projects/geomspace/files/Models/5Tetra.gmsp \
	make.patch \
	x11.patch\
	deps.patch\
	desktop.patch)
md5sums=('00107ea0f443c1b9f800876b3b5d1342'
			'14560f6f2cba975be1ba8d047b5acec5'
			'205c728191134d15cd5053e37c30a454'
			'520350c4ab6aa1385f75028d22e769be'
			'70411ddfa47c969132274d49383f7f19'
			'17774ac560e38ffb94bb95abd91bc5f4'
			'b2ebed4874f2f96fdcf002bf297e8f58'
			'582e9105abc065e41b8edf976799de78')
_pkgname=GeomSpace
build() {
   cd $srcdir/GeomSpace/make
   patch Makefile < $srcdir/make.patch
	patch x11.mk < $srcdir/x11.patch
	patch deps < $srcdir/deps.patch
	echo "OS = linux" >> platform
	make || return 1
	cd $srcdir/GeomSpace/bin
	patch GeomSpace.desktop < $srcdir/desktop.patch
}
package() {
    install -D -m755 $srcdir/GeomSpace/bin/GeomSpace $pkgdir/usr/bin/geomspace
    install -D -m644 $srcdir/GeomSpace/doc/DeveloperManual-en.pdf $pkgdir/usr/share/doc/$pkgname/DeveloperManual-en.pdf
    install -D -m644 $srcdir/GeomSpace/doc/UserManual-en.pdf $pkgdir/usr/share/doc/$pkgname/UserManual-en.pdf
    install -D -m644 $srcdir/UniformGeomSpace-2010.11.02-en.pdf $pkgdir/usr/share/doc/$pkgname/UniformGeomSpace-2010.11.02-en.pdf
	 install -D -m644 $srcdir/GeomSpace/bin/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	 install -D -m644 $srcdir/GeomSpace/bin/icn/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
	 install -d -m755 ${pkgdir}/usr/share/${_pkgname}
	 install -d -m755 ${pkgdir}/usr/share/${_pkgname}/models
	 install -d -m755 ${pkgdir}/usr/share/${_pkgname}/i18n
	 install -D -m644 ../5Cubes.gmsp ${pkgdir}/usr/share/${_pkgname}/models
	 install -D -m644 ../5Tetra.gmsp ${pkgdir}/usr/share/${_pkgname}/models	
	 install -D -m644 $srcdir/GeomSpace/bin/i18n/C ${pkgdir}/usr/share/${_pkgname}/i18n
	 install -D -m644 $srcdir/GeomSpace/bin/i18n/de ${pkgdir}/usr/share/${_pkgname}/i18n
	 install -D -m644 $srcdir/GeomSpace/bin/i18n/ro ${pkgdir}/usr/share/${_pkgname}/i18n
	 install -D -m644 $srcdir/GeomSpace/bin/i18n/ru ${pkgdir}/usr/share/${_pkgname}/i18n
    msg "\033[31;1m The user manual and a document containing a theory explanation have been installed to /usr/share/doc/$pkgname. It is strongly recommended to read them in order to use Geomspace! \033[0m"
	 msg "\033[31;1m Some models of geometrical objects have been installed to /usr/share/$pkgname/models. Additional models can be found at http://sourceforge.net/projects/geomspace/files/Models/ \033[0m"
}
