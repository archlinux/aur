# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com ) 
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

_pkgbasename=tk85
pkgname=lib32-$_pkgbasename
pkgver=8.5.19
pkgrel=1
pkgdesc="A windowing toolkit for use with tcl, 8.5 series"
arch=('x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
depends=('lib32-tcl85' 'lib32-libxss' 'lib32-libxft' "$_pkgbasename")
makedepends=('gcc-multilib')
provides=("lib32-tk" "lib32-tk=${pkgver}")
source=(http://downloads.sourceforge.net/sourceforge/tcl/tk${pkgver}-src.tar.gz)
md5sums=('e89df710447cce0fc0bde65667c12f85')
options=('staticlibs')

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	cd ${srcdir}/tk${pkgver}/unix
	
	./configure --libdir=/usr/lib32 --prefix=/usr --mandir=/usr/share/man --enable-threads --with-tcl=/usr/lib32/tcl8.5 --includedir=/usr/include/tk8.5
	
	make CFLAGS="-I/usr/include/tcl8.5"
}

package() {
	lib_dir_rel=/usr/lib32
	lib_dir="$pkgdir$lib_dir_rel"
	cd ${srcdir}/tk${pkgver}/unix
	
	make INSTALL_ROOT=${pkgdir} install install-private-headers
	rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
	ln -s libtk8.5.so "$lib_dir/libtk8.5.so.0"
	sed -i "s#${srcdir}#/usr/src#" $lib_dir/tkConfig.sh
	mv $lib_dir/tkConfig.sh $lib_dir/tk8.5/
	mv $lib_dir/pkgconfig/tk.pc $lib_dir/pkgconfig/tk85.pc
	install -dm 755 -p "${pkgdir}"/usr/share/licenses
	ln -s $_pkgbasename "${pkgdir}"/usr/share/licenses/$pkgname
}
