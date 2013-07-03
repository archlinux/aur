# Maintainer: lantw44 (at) gmail (dot) com
# http://codepad.org/XEk6PJYc

pkgname=yaehmop
pkgver=3.1.0b2
pkgrel=1
pkgdesc="Yet Another Extended Huckel Molecular Orbital Package"
arch=('x86_64' 'i686')
url="http://yaehmop.sourceforge.net/"
license=('GPL')
depends=('gcc-fortran' 'readline' 'libx11' 'blas' 'lapack')

source=('http://downloads.sourceforge.net/project/yaehmop/yaehmop-beta/3.1.0b2/bind.3.1.0b2.tgz'
		'http://downloads.sourceforge.net/project/yaehmop/yaehmop-beta/3.1.0b2/viewkel.3.1.0b.tgz'
		'http://downloads.sourceforge.net/project/yaehmop/yaehmop-beta/3.1.0b2/dense_eval.3.1.0b.tgz'
		'0001-Fix-build-problems.patch')

md5sums=('5a717a1f9c5dbe6cf36de15cb3c5b6ef'
		'd629bface0f610f7a4a1b3d0305872ca'
		'aec78fae520950777b7738cf42626d99'
		'4290dcf6a1ddb040c38dbb54d8698c5b')

build() {
	cd "${srcdir}/${pkgname}"
	mv ../viewkel ./
	mv ../dense_eval viewkel/
	mkdir bin
	rm -f tightbind/bind
	rm -f tightbind/utils/fit_coop
	rm -f tightbind/utils/fit_coop.o
	rm -f tightbind/utils/fit_dos
	rm -f tightbind/utils/fit_dos.o
	rm -f tightbind/utils/genutil.o
	patch -p1 < ../../0001-Fix-build-problems.patch
	cd tightbind
	make -f makefile.linux install
	cd ../viewkel
	make -f makefile.linux
	make -f makefile.linux install
	make liborbitals.a
	make libsolids.a
	make libgenutils.a
	cd dense_eval
	make
	cp -p dense_eval ../../bin
}

package() {
	mkdir -p "${pkgdir}/usr/share/${pkgname}/viewkel"
	cp -rp "${srcdir}/${pkgname}/bin" "${pkgdir}/usr/"
	install -m 644 "${srcdir}/${pkgname}/viewkel/new_atomic_parms.dat" \
		"${pkgdir}/usr/share/${pkgname}/viewkel"
}
