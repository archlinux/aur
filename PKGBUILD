# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=kactus2-git
pkgver=3.2.298.0.svn2649
pkgrel=1

pkgdesc="Open source IP-XACT-based tool for ASIC, FPGA and embedded systems design"
arch=('any')
url="http://funbase.cs.tut.fi/"
license=('GPLv2')

depends=('qt5-base' 'qt5-xmlpatterns')
makedepends=('qt5-tools')

source=(
	'svn://svn.code.sf.net/p/kactus2/code/trunk'
	'Makefile.patch'
)
md5sums=(
	'SKIP'
	'4f6cd25d0891c11dd4adca5610d3ef55'
)

pkgver() {
	cd "trunk"

	# Kactus2 version
	_distver=`sed -n -e 's/.*VERSION_FULL\s*\(\S*\)\s*/\1/p' version.h`
	# Revision number of the last commit
	_svnver=`svn log -l 1 | head -n 2 | sed -n -e 's/^r\([0-9]*\).*/\1/p'`

	echo $_distver.svn$_svnver;
}

build() {
	cd "trunk"

	./configure --prefix=/usr

	# Patch the generated Makefile: fix some install recipes
	patch -p0 -N -i "${startdir}"/Makefile.patch

	make
}

package() {
	cd "trunk"

	make INSTALL_ROOT="${pkgdir}" install
}

