# Maintainer: gls < ghostlovescorebg at gmail dot com >

pkgname=gentoo
pkgver=0.20.4
pkgrel=1
pkgdesc="A lightweight file manager for GTK"
arch=('i686' 'x86_64')
url="http://www.obsession.se/gentoo/"
license=('GPL2')
depends=('gtk3' 'gamin')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('9e10f5ad00613b63eb02cde89506153d')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	# CPPFLAGS must be set like this, otherwise, gentoo won't build.
	# Causes error: warning: #warning _FORTIFY_SOURCE requires compiling with optimization
	# (-O) [-Wcpp]
	CPPFLAGS=
	./configure --prefix=/usr --sysconfdir=/etc
	#sed -i -e '/GTK_DISABLE_DEPRECATED/s/^/# /' configure.ac
	#autoconf configure.in > configure
	sed -i 's/-Werror-implicit-function-declaration//g' Makefile
	sed -i 's/aclocal-1.13/aclocal/'g Makefile
	sed -i 's/automake-1.13/automake/'g Makefile
	sed -i 's/AC_USE_SYSTEM_EXTENSIONS//g' configure.ac
	make 
	ln -s ${pkgname}-${pkgver}/mkinstalldirs ..
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
	make prefix=${pkgdir}/usr sysconfdir=${pkgdir}/etc install
}
