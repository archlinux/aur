_pkgname=skychart
pkgname=skychart-git
pkgver=V42.587.gc5e5e0d8
pkgrel=1
pkgdesc="Free software to draw sky charts, also known as Cartes du Ciel. Git version"
arch=('x86_64')
license=('GPL')
depends=('qt5pas' 'libpasastro')
makedepends=('qt5pas' 'fpc' 'lazarus')
conflicts=('skychart' 'skychart-bin')
url="http://www.ap-i.net/skychart/start"
source=("git+https://github.com/pchev/skychart.git")
sha256sums=('SKIP')
optdepends=('skychart-data-stars: Standard stars catalog for skychart, down to magnitude 12, variables and double stars: Tycho2, GCVS, WDS. Search index for SAO, BD, HD, GC'
	    'skychart-data-pictures: DSO pictures for skychart. 9700 pictures for object of the SAC and OpenNGC catalog'
	    'skychart-data-dso: All the standard nebulae catalog for skychart: NGC, PGC, GCM, GPN, LBN, OCL, including 5 million galaxies from Hyperleda 2017')

pkgver() {
	cd ${_pkgname}
	git describe --always | sed 's/-/./g'
}

build() {
	cd "${_pkgname}"
	fpc="/usr/lib/fpc/""`fpc -iV`""/units/x86_64-linux/"
	echo fpc=$fpc
	echo ./configure fpc="$fpc" lazarus=/usr/lib/lazarus prefix="$pkgdir/usr" target=x86_64-linux 
	./configure fpc="$fpc" lazarus=/usr/lib/lazarus prefix="$pkgdir/usr" target=x86_64-linux 
	make CPU_TARGET=x86_64 OS_TARGET=linux clean
	make CPU_TARGET=x86_64 OS_TARGET=linux -j 1
}

package() {
	cd "${_pkgname}"
	echo pkgdir $pkgdir
	mkdir -p "$pkgdir/usr"
	make install
	make install_data
	make install_doc
	make install_nonfree
}
