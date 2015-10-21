# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=ghdl-mcode-hg
pkgver=0.33.hg900
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='VHDL simulator - mcode version'
url='http://sourceforge.net/projects/ghdl-updates/'
license=('GPLv2')

provides=('ghdl')
conflicts=('ghdl' 'ghdl-hg')
makedepends=('gcc-ada-multilib' 'mercurial')
depends=('lib32-glibc' 'lib32-zlib')

source=(
	"ghdl::hg+http://hg.code.sf.net/p/ghdl-updates/code"
)
md5sums=(
	'SKIP'
)

pkgver() {
	cd "${srcdir}/ghdl"

	# GHDL version (extracted from version.ads)
	_distver=`sed -n -e 's/.*GHDL \([0-9.a-z]*\) (.*/\1/p' src/version.ads`
	# Changeset number (asked to mercurial)
	_hgver=`hg log -l1 | sed -n -e 's/.*changeset:\s*\([0-9]*\).*/\1/p'`

	echo $_distver.hg$_hgver;
}

build() {
	cd "${srcdir}/ghdl"

	./configure --prefix=/usr/

	# Set flags for 32-bits compatibility
	if [[ `uname -m` -eq "x86_64" ]]
	then
		sed -i 's@CC=gcc@CC=gcc -m32@' Makefile
		sed -i 's@GNATMAKE=gnatmake@GNATMAKE=gnatmake -m32@' Makefile
	fi

	make

}

package() {
	cd "${srcdir}/ghdl"

	make DESTDIR="${pkgdir}" install

}
