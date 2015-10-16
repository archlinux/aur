# Contributer: N30N <archlinux@alunamation.com>
# Contributer: Wenzel Jakob <wenzel@mitsuba-renderer.org>

_pkgname="collada-dom"
pkgname="$_pkgname-mitsuba"
pkgver=2.4.0
pkgrel=1
pkgdesc="An API that provides a C++ object representation of a COLLADA XML instance document.For mitsuba."
url="http://collada-dom.sourceforge.net/"
license=("MIT")
arch=("i686" "x86_64")
depends=("libxml2" "boost" "pcre")
# makedepends=()
#provides=("$_pkgname=2.4.0")
#conflicts=("$_pkgname")
source=("http://downloads.sourceforge.net/${_pkgname}/collada-dom-${pkgver}.tgz")
md5sums=("20399de4206eab850c32e65c04e907cb")

prepare() {
    cd ${_pkgname}-${pkgver}/dom
    sed -i.bak "s/domMinorVersion := 2/domMinorVersion := 4/g" Makefile
    cd external-libs
    rm -Rf minizip
    mv minizip-1.1 minizip
    ln -s . minizip/src
    ln -s . minizip/include
}

build() {
	cd ${_pkgname}-${pkgver}/dom
	make project=minizip
	rm build/linux-1.4/libminizip.so*
	make project=dom libOpts="-lpcre -lpcrecpp -Lbuild/linux-1.4 -lxml2 -lminizip -Wl,-soname -Wl,libcollada14dom.so.2.4"  ccFlags="-DDOM_INCLUDE_LIBXML -DCOLLADA_DOM_SUPPORT141 -fPIC -DDOM_INCLUDE_LIBXML -O3"
}

package() {
	cd ${_pkgname}-${pkgver}/dom

	install -d ${pkgdir}/usr/lib ${pkgdir}/usr/include
	make prefix=${pkgdir}/usr project=dom install
	mv ${pkgdir}/usr/include/colladadom ${pkgdir}/usr/include/collada-dom-mitsuba

	install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set noet ff=unix:
