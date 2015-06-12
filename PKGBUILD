# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com ) 
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=tk85
pkgver=8.5.17
pkgrel=1
pkgdesc="A windowing toolkit for use with tcl, 8.5 series"
arch=('i686' 'x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
depends=('tcl85' 'libxss' 'libxft')
provides=("tk" "tk=${pkgver}")
source=(http://downloads.sourceforge.net/sourceforge/tcl/tk${pkgver}-src.tar.gz)
md5sums=('33ae493313369f3d3f292e4a9644a294')
options=('staticlibs')

build() {
	cd ${srcdir}/tk${pkgver}/unix
	
	[[ $CARCH == "x86_64" ]] && BIT="--enable-64bit"
	./configure --prefix=/usr --mandir=/usr/share/man --enable-threads $BIT --with-tcl=/usr/lib/tcl8.5 --includedir=/usr/include/tk8.5
	
	make CFLAGS="-I/usr/include/tcl8.5"
}

package() {
	cd ${srcdir}/tk${pkgver}/unix
	
	make INSTALL_ROOT=${pkgdir} install install-private-headers
	ln -s libtk8.5.so "${pkgdir}/usr/lib/libtk8.5.so.0"
	
	# install license
	install -Dm644 license.terms ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	rm -r ${pkgdir}/usr/share/man
	
	# remove buildroot traces
	sed -i "s#${srcdir}#/usr/src#" ${pkgdir}/usr/lib/tkConfig.sh
	mv ${pkgdir}/usr/lib/tkConfig.sh ${pkgdir}/usr/lib/tk8.5/

	# rename files
	mv ${pkgdir}/usr/lib/pkgconfig/tk.pc ${pkgdir}/usr/lib/pkgconfig/tk85.pc
}
