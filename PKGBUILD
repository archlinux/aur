# Maintainer: Christian Erikson               
pkgname=intarna-git 
pkgver=v3.1.5  
pkgrel=1
pkgdesc="Efficient target prediction incorporating accessibility of interaction sites"
arch=('any')
url="https://github.com/BackofenLab/IntaRNA"
license=('GPL')
groups=()

depends=('boost' 'viennarna')
makedepends=('git' 'cmake' )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

_tag=${pkgver}
_dir=${pkgname%-git}
source=("${_dir}"::"git+https://github.com/BackofenLab/IntaRNA.git"#tag=${_tag})
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

build(){
	cd "$srcdir/${pkgname%-git}"
	set -e -o pipefail

	#test -d config || mkdir config
	# Produce aclocal.m4, so autoconf gets the automake macros it needs
	echo "Creating aclocal.m4..."
	aclocal || exit $?;

	# Produce config.h raw file
	autoheader || exit $?;

	# Produce all the `Makefile.in's, verbosely, and create neat missing things
	# like `libtool', `install-sh', etc.
	automake --add-missing --gnu --copy || exit $?;

	# If there's a config.cache file, we may need to delete it.  
	# If we have an existing configure script, save a copy for comparison.
	if [ -f config.cache ] && [ -f configure ]; then
	  cp configure configure.$$.tmp
	fi

	# Produce ./configure
	echo "Creating configure..."
	autoconf || exit $?;

	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make tests
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
