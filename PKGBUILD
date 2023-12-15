# Maintainer: Daniel Gerbet <daniel.gerbet1 at tu-dresden dot de>

pkgname=saclib
pkgver=2.2.8
pkgrel=1
pkgdesc="A C library for computer algebra derived from the SAC2 system"
arch=('x86_64')
url="https://www.usna.edu/Users/cs/wcbrown/qepcad/B/QEPCAD.html"
license=('custom:RISC-Linz')
makedepends=('perl' 'bash' 'make' 'gcc')
source=("https://www.usna.edu/Users/cs/wcbrown/qepcad/INSTALL/${pkgname}${pkgver}.tgz")
md5sums=("2a251651bc96a14eba4300f18ec4cbb4")

prepare() {
	cd "${pkgname}${pkgver}"
	sed "s%^#include \"\(.*\)\"$%#include \"${pkgname}/\1\"%" "include/saclib.h" > saclib.h
}

build() {
	cd "${pkgname}${pkgver}"
	export saclib="${PWD}"
	cd bin
	./sconf
	./mkproto
	./mkmake
	./mklib opt
}

package() {
	cd "${pkgname}${pkgver}"

	incdir="${pkgdir}/usr/include/${pkgname}"
	install -d "${incdir}"
	install -m644 "saclib.h" "${pkgdir}/usr/include"
	install -m644 "include/hfloats.h" "${incdir}"
	install -m644 "include/sacmacros.h" "${incdir}"
	install -m644 "include/sacproto.h" "${incdir}"
	install -m644 "include/sacsys.h" "${incdir}"
	install -m644 "include/sactypes.h" "${incdir}"
	install -m644 "include/sysdep.h" "${incdir}"

	install -D -m644 -t "${pkgdir}/usr/lib/" "lib/saclibo.a"

	install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"

	# the doumentation seems outdated, but better keep this one
	# as the compiled version is already downloaded, avoid compilation,
	# which would require latex and makeindex
	install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}" "doc/saclib.pdf"
}
