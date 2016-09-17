# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com )
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Committer: Judd Vinet <jvinet@zeroflux.org>

_pkgbasename=tcl85
pkgname=lib32-$_pkgbasename
pkgver=8.5.19
pkgrel=1
pkgdesc="The Tcl scripting language, 8.5 series"
arch=('x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
depends=('lib32-glibc' "$_pkgbasename")
makedepends=('gcc-multilib')
provides=("lib32-tcl" "lib32-tcl=$pkgver")
source=(http://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz)
md5sums=('4f4e1c919f6a6dbb37e9a12d429769a6')
options=('staticlibs')

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	cd ${srcdir}/tcl${pkgver}/unix
	
	# we build the tcl sqlite interface in sqlite-tcl package
	rm -rf ${srcdir}/tcl${pkgver}/pkgs/sqlite3*
	
	./configure --libdir=/usr/lib32 --prefix=/usr --mandir=/usr/share/man \
                --includedir=/usr/include/tcl8.5
	
	make
}

check() {
	cd ${srcdir}/tcl${pkgver}/unix
	make test
}

package()
{
	lib_dir_rel=/usr/lib32
	lib_dir="$pkgdir$lib_dir_rel"
	cd ${srcdir}/tcl${pkgver}/unix
	
	make INSTALL_ROOT=${pkgdir} install install-private-headers
	rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
	ln -s libtcl8.5.so "$lib_dir/libtcl8.5.so.0"
	sed -e "s#${srcdir}/tcl${pkgver}/unix#/usr/lib32#" \
		-e "s#${srcdir}/tcl${pkgver}#/usr/include#" \
		-i "${pkgdir}/usr/lib32/tclConfig.sh"
	sed -i "s#${srcdir}#/usr/src#" $lib_dir/tclConfig.sh
	mkdir $lib_dir/tcl8.5
	mv $lib_dir/tclConfig.sh $lib_dir/tcl8.5/
	mv $lib_dir/pkgconfig/tcl.pc $lib_dir/pkgconfig/tcl85.pc
	install -dm 755 -p "${pkgdir}"/usr/share/licenses
	ln -s $_pkgbasename "${pkgdir}"/usr/share/licenses/$pkgname
}
