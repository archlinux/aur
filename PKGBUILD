# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=tcl84
pkgver=8.4.20
pkgrel=1
pkgdesc="The Tcl scripting language, 8.4 series"
arch=('x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
provides=("tcl" "tcl=${pkgver}")
source=(http://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz)
md5sums=('b57ecc6540026fd4a83288ac6bf2b02b')
options=('staticlibs')

build() {
	cd ${srcdir}/tcl${pkgver}/unix
	
	# we build the tcl sqlite interface in sqlite-tcl package
	rm -rf ${srcdir}/tcl${pkgver}/pkgs/sqlite3*

	autoreconf
	./configure --prefix=/usr --mandir=/usr/share/man --enable-threads --enable-64bit \
                --includedir=/usr/include/tcl8.4
	
	make
}

check() {
	cd ${srcdir}/tcl${pkgver}/unix
	make test
}

package()
{
	cd ${srcdir}/tcl${pkgver}/unix
	
	make INSTALL_ROOT=${pkgdir} install install-private-headers
	ln -s libtcl8.4.so "${pkgdir}/usr/lib/libtcl8.4.so.0"
	
	# install license
	install -Dm644 ../license.terms ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	rm -r ${pkgdir}/usr/share/man
	
	# remove buildroot traces
	sed -i "s#${srcdir}#/usr/src#" ${pkgdir}/usr/lib/tclConfig.sh
	mv ${pkgdir}/usr/lib/tclConfig.sh ${pkgdir}/usr/lib/tcl8.4/
}
