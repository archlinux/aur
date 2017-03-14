# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=gmp-hg
pkgver=6.1.99.hg17327
pkgrel=1
pkgdesc="A free library for arbitrary precision arithmetic"
arch=('i686' 'x86_64')
url="http://gmplib.org/"
license=('LGPL3' 'GPL')

depends=('gcc-libs' 'sh')
makedepends=('mercurial')
provides=("gmp=$pkgver")
conflicts=('gmp')

source=(
	"hg+https://gmplib.org/repo/gmp/"
)
md5sums=(
	'SKIP'
)

pkgver() {
	cd "gmp"

	# GMP version (extracted from gmp-h.in)
	_gmpvermaj=`sed -n -e 's/^.*__GNU_MP_VERSION[[:space:]]*\([[:digit:]]*\)[[:space:]]*$/\1/p' gmp-h.in`
	_gmpvermin=`sed -n -e 's/^.*__GNU_MP_VERSION_MINOR[[:space:]]*\([[:digit:]]*\)[[:space:]]*$/\1/p' gmp-h.in`
	_gmpverrev=`sed -n -e 's/^.*__GNU_MP_VERSION_PATCHLEVEL[[:space:]]*\([[:digit:]]*\)[[:space:]]*$/\1/p' gmp-h.in`
	_gmpver=$_gmpvermaj.$_gmpvermin.$_gmpverrev
	# Date of the last commit
	_hgver=`hg identify -n`

	echo $_gmpver.hg$_hgver;
}

build() {
	cd "gmp"

	# Optional: Use makepkg config for debug mode (see your /etc/makepkg.conf)
	#CFLAGS=${DEBUG_CFLAGS}
	#CXXFLAGS=${DEBUG_CXXFLAGS}

	./.bootstrap

	./configure --build=${CHOST} \
		--prefix=/usr \
		--enable-cxx \
		--enable-fat

	make
}

check() {
	cd "gmp"
	make check
}

package() {
	cd "gmp"
	make DESTDIR="${pkgdir}" install
}

