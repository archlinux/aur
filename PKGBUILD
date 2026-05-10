# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=geomspace
pkgver=0.15
pkgrel=1
pkgdesc="A browser for geometric (i.e. Euclidean, Riemann, Minkowski) spaces"
arch=($CARCH)
url="https://sourceforge.net/projects/geomspace/"
license=(GPL-2.0-only)
depends=(mesa fltk)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgver/GeomSpace-$pkgver-pre-src.tar.gz
		http://downloads.sourceforge.net/project/$pkgname/Theory/UniformGeomSpace-2010.11.02-en.pdf
		make.patch
		x11.patch
		deps.patch)
sha256sums=('f20a8f1f189f8f3084f6ceeece99c7818c1563b83f593de4dfcf37b0570e7f11'
            '0f045c086e745dccf45e66d4a361cea91fde0c913a0d67150ac79ef7a2ed466a'
            '2610c6e1e7dc709b8270c8e52048b02b790ed19eb30b12c8cc711892f07eb262'
            '6ef44e2cea1ebed7fe94acbd28ab894311183ab0f3396ba41b2ed49ec2a186a1'
            '206b2b69d1e7aad483e5858857c662ef267038f4715378054c9680a6eeb2480b')

prepare() {
	cd GeomSpace/make
	patch Makefile < $srcdir/make.patch
	patch x11.mk < $srcdir/x11.patch
	patch deps < $srcdir/deps.patch
}

build() {
	cd GeomSpace/make
	make prepare
	make compile
	make build
}

package() {
	install -Dm755 GeomSpace/bin/GeomSpace -t $pkgdir/usr/bin/
	install -Dm644 GeomSpace/bin/i18n/* -t $pkgdir/usr/share/GeomSpace/i18n/
	install -Dm644 GeomSpace/bin/icn/* -t $pkgdir/usr/share/GeomSpace/icn/
	install -Dm644 GeomSpace/bin/glsl/*.glsl -t $pkgdir/usr/share/GeomSpace/glsl/
	install -Dm644 GeomSpace/models/*.gms* -t $pkgdir/usr/share/GeomSpace/models/
	install -Dm644 UniformGeomSpace-2010.11.02-en.pdf GeomSpace/doc/{DeveloperManual-en.pdf,UserManual-en.pdf} -t \
		$pkgdir/usr/share/doc/$pkgname/
	install -Dm644 GeomSpace/bin/GeomSpace.desktop -t $pkgdir/usr/share/applications/
	
	msg "\033[31;1m The user manual and a document containing a theory explanation have been installed to /usr/share/doc/$pkgname. It is strongly recommended to read them in order to use Geomspace! \033[0m"
	msg "\033[31;1m Some models of geometrical objects have been installed to /usr/share/$pkgname/models. Additional models can be found at http://sourceforge.net/projects/geomspace/files/Models/ \033[0m"
}
