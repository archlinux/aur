# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=ghdl-llvm-git
pkgver=0.37dev.git20190925
pkgrel=1
arch=('any')
pkgdesc='VHDL simulator - LLVM back-end'
url='https://github.com/ghdl/ghdl'
license=('GPLv2')

provides=('ghdl')
conflicts=('ghdl' 'ghdl-gcc-git' 'ghdl-mcode-git')
makedepends=('gcc-ada' 'git' 'llvm' 'clang')

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

	# Note : Add --enable-openieee to use free (but not complete) implementation of IEEE VHDL libs
	./configure \
		--prefix=/usr/ \
		--with-llvm-config \
		--enable-libghdl \
		--enable-synth

	make
}

package() {
	cd "${srcdir}/ghdl"

	make DESTDIR="${pkgdir}" install

	# In case it does not exist, create symlink libghdl.so
	local _gso=`ls "${pkgdir}/usr/lib/" | grep -e '^libghdl-.*\.so$' | head -n 1`
	if [[ -n "$_gso" ]] ; then
		ln -s "$_gso" "${pkgdir}/usr/lib/libghdl.so"
	fi

}
