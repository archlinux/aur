# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=ghdl-llvm-git
pkgver=0.37dev.git20190702
pkgrel=1
arch=('any')
pkgdesc='VHDL simulator - LLVM flavour'
url='https://github.com/tgingold/ghdl'
license=('GPLv2')

provides=('ghdl')
conflicts=('ghdl' 'ghdl-gcc-git' 'ghdl-mcode-git')
makedepends=('gcc-ada' 'git' 'llvm<9' 'clang<9')

source=(
	"ghdl::git://github.com/ghdl/ghdl.git"
)
md5sums=(
	'SKIP'
)

pkgver() {
	cd "${srcdir}/ghdl"

	# GHDL version (extracted from configure)
	_distver=`sed -n -e 's/^ghdl_version=.*"\(.*\)".*/\1/p' configure | tr -d '-'`
	# Date of the last git commit
	_gitver=`git log -n 1 --date=short | sed -n -e 's/.*Date:\s*\([0-9-]*\).*/\1/p' | tr -d -`

	echo $_distver.git$_gitver;
}

build() {
	cd "${srcdir}/ghdl"

	./configure --prefix=/usr/ --with-llvm-config

	make
}

package() {
	cd "${srcdir}/ghdl"

	make DESTDIR="${pkgdir}" install
}
