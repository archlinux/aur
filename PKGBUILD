pkgname=dietlibc-cvs
pkgver=20150317
pkgrel=1
pkgdesc="a libc optimized for small size"
arch=('i686' 'x86_64')
url="http://www.fefe.de/dietlibc/"
license="GPL"
options=('staticlibs' '!buildflags' '!strip' '!makeflags')
provides=(dietlibc)
conflicts=(dietlibc)
makedepends=('cvs')

_cvsroot=":pserver:cvs@cvs.fefe.de:/cvs"
_cvsmod="dietlibc"

pkgver() { date --iso-8601|tr -d - ; }

prepare() {
	cd $srcdir
		msg "getting $_cvsmod from $_cvsroot ..."
	if [ -d $_cvsmod/CVS ]; then
		cd $_cvsmod
		cvs -z9 update -d
	else
		cvs -d $_cvsroot -z9 co $_cvsmod
	fi
}

build() {
	rm -rf "$srcdir/$_cvsmod-build"
	cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
	cd "$srcdir/$_cvsmod-build"

	# save some space - adjust if required
	sed -i '/#define WANT_IPV6_DNS/d' dietfeatures.h
	sed -i '/#define WANT_PLUGPLAY_DNS/d' dietfeatures.h
	sed -i '/#define WANT_VALGRIND_SUPPORT/d' dietfeatures.h
	sed -i '/#define WANT_FULL_RESOLV_CONF/d' dietfeatures.h
	sed -i '/#define WANT_LD_SO_GDB_SUPPORT/d' dietfeatures.h
	sed -i '/#define WANT_HIGH_PRECISION_MATH/d' dietfeatures.h

	# fix build aug2014 gcc4.9.1
	sed -i 's/-fPIC/& -fno-asynchronous-unwind-tables/' x86_64/Makefile.add

        PATH=/usr/bin make all
}

package() {
	cd "$srcdir/$_cvsmod-build"
	make DESTDIR=$pkgdir install
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/diet/bin/diet "$pkgdir"/usr/bin/diet
}
