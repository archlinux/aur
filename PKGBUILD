pkgname=libguytools-svn
pkgver=2.0.5.r13
pkgrel=1
pkgdesc='A library developed for guymager'
url="https://guymager.sourceforge.io/"
license=('GPL')
makedepends=('svn')
depends=('qt5-base')
provides=('libguytools')
conflicts=('libguytools')
arch=('x86_64' 'i686')
source=($pkgname::'svn+https://svn.code.sf.net/p/libguytools/code/')
sha512sums=(SKIP)

pkgver() {
	cd "$srcdir/$pkgname"

	local rev="$(svnversion)"
	printf "%s.r%s" "${pkgver%%.r*}" "${rev//[[:alpha:]]}"
}

prepare() {
	cd "$srcdir/$pkgname/tags/tools-${pkgver%%.r*}"
	./create_version_file.sh
}

build() {
	cd "$srcdir/$pkgname/tags/tools-${pkgver%%.r*}"
	qmake tools.pro
	make
	qmake toolsstatic.pro
	make
}

package() {
	cd "$srcdir/$pkgname/tags/tools-${pkgver%%.r*}"
	install -dm755 "$pkgdir"/usr/{lib,include/libguytools2}
	cp -d lib/libguytool* "$pkgdir"/usr/lib
	cp -R include/* "$pkgdir"/usr/include/libguytools2
}
