# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

_pkgbase='libindicator'
pkgbase="lib32-${_pkgbase}"
pkgname=("${pkgbase}-gtk"{2,3})
pkgver=12.10.1
pkgrel=5
pkgdesc="Libary with a set of symbols and convience functions that all indicators would like to use (32-bit)"
arch=('i686' 'x86_64')
url="https://launchpad.net/${_pkgbase}"
license=('GPL3')
makedepends=('gcc-multilib' "lib32-gtk"{2,3})
options=('!libtool')
install="${pkgbase}.install"
source=("https://launchpad.net/${_pkgbase}/${pkgver%.*}/${pkgver}/+download/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('b2d2e44c10313d5c9cd60db455d520f80b36dc39562df079a3f29495e8f9447f')

prepare() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	sed '/-Werror/s/$/ -Wno-deprecated-declarations/' -i ${_pkgbase}/Makefile.{am,in}
	sed 's/LIBINDICATOR_LIBS+="$LIBM"/LIBINDICATOR_LIBS+=" $LIBM"/g' -i configure
	sed 's/LIBM="-lmw"/LIBM=" -lmw"/g' -i configure
	sed 's/LIBM="-lm"/LIBM=" -lm"/g' -i configure
	sed 's/LIBS="-lm  $LIBS"/LIBS=" -lm  $LIBS"/g' -i configure
	sed 's/LIBS="-lmw  $LIBS"/LIBS=" -lmw  $LIBS"/g' -i configure
	sed 's/LIBM="-lm"/LIBM=" -lm"/g' -i m4/libtool.m4

	cd "${srcdir}"
	rm -rf "${pkgbase}-gtk"{2,3} &> /dev/null
	cp -rp "${_pkgbase}-${pkgver}" "${pkgbase}-gtk2"
	mv     "${_pkgbase}-${pkgver}" "${pkgbase}-gtk3"
}

build() {
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

	cd "${srcdir}/${pkgbase}-gtk2"
	./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --libexecdir="/usr/lib32/${_pkgbase}-gtk2" \
	            --libdir='/usr/lib32' --disable-{static,tests} --with-gtk=2
	make -j1

	cd "${srcdir}/${pkgbase}-gtk3"
	./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --libexecdir="/usr/lib32/${_pkgbase}-gtk3" \
	            --libdir='/usr/lib32' --disable-{static,tests} --with-gtk=3
	make -j1
}

package_lib32-libindicator-gtk2() {
	pkgdesc+=" (GTK+ 2 library)"
	depends=("${_pkgbase}-gtk2" 'lib32-gtk2')
	provides=("${pkgbase}")
	conflicts=("${pkgbase}")

	cd "${srcdir}/${pkgname}"
	make -j1 DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}"/usr/{include,share,bin}
}

package_lib32-libindicator-gtk3() {
	pkgdesc+=" (GTK+ 3 library)"
	depends=("${_pkgbase}-gtk3" 'lib32-gtk3')
	provides=("${pkgbase}3")
	conflicts=("${pkgbase}3")

	cd "${srcdir}/${pkgname}"
	make -j1 DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}"/usr/{include,share,bin}
}
