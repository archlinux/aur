# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=tcl85-static
pkgver=8.5.19
pkgrel=2
pkgdesc="The Tcl scripting language, 8.5 series"
arch=('i686' 'x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
source=(http://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz)
md5sums=('4f4e1c919f6a6dbb37e9a12d429769a6')
options=('staticlibs')

build() {
	cd ${srcdir}/tcl${pkgver}/unix
	
	# we build the tcl sqlite interface in sqlite-tcl package
	rm -rf ${srcdir}/tcl${pkgver}/pkgs/sqlite3*
	
	[[ $CARCH == "x86_64" ]] && BIT="--enable-64bit"
	./configure --prefix=/opt/tcl85-static --mandir=/opt/tcl85-static/share/man --enable-threads --disable-shared $BIT
	
	make
}

package()
{
	cd ${srcdir}/tcl${pkgver}/unix
	
	make INSTALL_ROOT=${pkgdir} install install-private-headers
	
	# install license
	install -Dm644 ../license.terms ${pkgdir}/opt/tcl85-static/share/licenses/${pkgname}/LICENSE
	rm -r ${pkgdir}/opt/tcl85-static/share/man
	mv ${pkgdir}/opt/tcl85-static/lib/tcl8/  ${pkgdir}/opt/tcl85-static/lib/tcl8.5/
	sed -i -e's:variable paths {}:variable paths {/opt/tcl85-static/lib/tcl$(v)/tcl8}:' \
                    ${pkgdir}/opt/tcl85-static/lib/tcl8.5/tm.tcl
	
	# remove buildroot traces
	sed -i "s#${srcdir}#/opt/tcl85-static/src#" ${pkgdir}/opt/tcl85-static/lib/tclConfig.sh
	mv ${pkgdir}/opt/tcl85-static/lib/tclConfig.sh ${pkgdir}/opt/tcl85-static/lib/tcl8.5/

	# rename files
	mv ${pkgdir}/opt/tcl85-static/lib/pkgconfig/tcl.pc ${pkgdir}/opt/tcl85-static/lib/pkgconfig/tcl85.pc
}
