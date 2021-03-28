# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com )
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Committer: Judd Vinet <jvinet@zeroflux.org>

_pkgbasename=tcl84
pkgname=lib32-$_pkgbasename
pkgver=8.4.20
pkgrel=1
pkgdesc="The Tcl scripting language, 8.4 series"
arch=('x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
depends=('lib32-glibc' "$_pkgbasename")
makedepends=('gcc-multilib')
provides=("lib32-tcl" "lib32-tcl=$pkgver")
source=(http://downloads.sourceforge.net/sourceforge/tcl/tcl${pkgver}-src.tar.gz)
md5sums=('b57ecc6540026fd4a83288ac6bf2b02b')
options=('staticlibs')

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	cd ${srcdir}/tcl${pkgver}/unix
	
	# we build the tcl sqlite interface in sqlite-tcl package
	rm -rf ${srcdir}/tcl${pkgver}/pkgs/sqlite3*

	autoreconf
	./configure --libdir=/usr/lib32 --prefix=/usr --mandir=/usr/share/man \
                --includedir=/usr/include/tcl8.4
	
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
	ln -s libtcl8.4.so "$lib_dir/libtcl8.4.so.0"
	sed -e "s#${srcdir}/tcl${pkgver}/unix#/usr/lib32#" \
		-e "s#${srcdir}/tcl${pkgver}#/usr/include#" \
		-i "${pkgdir}/usr/lib32/tclConfig.sh"
	sed -i "s#${srcdir}#/usr/src#" $lib_dir/tclConfig.sh
	mkdir $lib_dir/tcl8.4
	mv $lib_dir/tclConfig.sh $lib_dir/tcl8.4/
	install -dm 755 -p "${pkgdir}"/usr/share/licenses
	ln -s $_pkgbasename "${pkgdir}"/usr/share/licenses/$pkgname
}
