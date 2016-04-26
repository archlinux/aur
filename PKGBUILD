# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com )
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=tcl85
pkgver=8.5.19
pkgrel=1
pkgdesc="The Tcl scripting language, 8.5 series"
arch=('i686' 'x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
provides=("tcl" "tcl=${pkgver}")
source=(http://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz)
md5sums=('4f4e1c919f6a6dbb37e9a12d429769a6')
options=('staticlibs')

build() {
	cd ${srcdir}/tcl${pkgver}/unix
	
	# we build the tcl sqlite interface in sqlite-tcl package
	rm -rf ${srcdir}/tcl${pkgver}/pkgs/sqlite3*
	
	[[ $CARCH == "x86_64" ]] && BIT="--enable-64bit"
	./configure --prefix=/usr --mandir=/usr/share/man --enable-threads $BIT \
                --includedir=/usr/include/tcl8.5
	
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
	ln -s libtcl8.5.so "${pkgdir}/usr/lib/libtcl8.5.so.0"
	
	# install license
	install -Dm644 ../license.terms ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	rm -r ${pkgdir}/usr/share/man
	mv ${pkgdir}/usr/lib/tcl8/  ${pkgdir}/usr/lib/tcl8.5/
	sed -i -e's:variable paths {}:variable paths {/usr/lib/tcl$(v)/tcl8}:' \
                    ${pkgdir}/usr/lib/tcl8.5/tm.tcl
	
	# remove buildroot traces
	sed -i "s#${srcdir}#/usr/src#" ${pkgdir}/usr/lib/tclConfig.sh
	mv ${pkgdir}/usr/lib/tclConfig.sh ${pkgdir}/usr/lib/tcl8.5/

	# rename files
	mv ${pkgdir}/usr/lib/pkgconfig/tcl.pc ${pkgdir}/usr/lib/pkgconfig/tcl85.pc
}
