# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=kactus2-git
pkgver=3.2.225.0.svn2627
pkgrel=1

pkgdesc="Open source IP-XACT-based tool for ASIC, FPGA and embedded systems design"
arch=('any')
url="http://funbase.cs.tut.fi/"
license=('GPLv2')

depends=('qt5-base' 'qt5-xmlpatterns')
makedepends=('qt5-tools')

source=(
	'svn://svn.code.sf.net/p/kactus2/code/trunk'
	'Kactus2.pri.patch'
	'IPlugin.h.patch'
	'Makefile.patch'
)
md5sums=(
	'SKIP'
	'71f78b07b45d926833160a251da484cc'
	'0463894cd56b192df5e42b231f86874f'
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

prepare() {
	cd "trunk"

	patch -p0 -N -i "${startdir}"/Kactus2.pri.patch || true
	patch -p0 -N -i "${startdir}"/IPlugin.h.patch || true
}

build() {
	cd "trunk"

	./configure --prefix=/usr

	patch -p0 -N -i "${startdir}"/Makefile.patch

	make
}

package() {
	cd "trunk"

	make INSTALL_ROOT="${pkgdir}" install
}

