# Maintainer: lantw44 (at) gmail (dot) com
# http://codepad.org/XEk6PJYc

pkgname=yaehmop
pkgver=3.1.0b2
pkgrel=4
pkgdesc="Yet Another extended Huckel Molecular Orbital Package (YAeHMOP)"
arch=('x86_64' 'i686')
url="http://yaehmop.sourceforge.net/"
license=('GPL')
depends=('gcc-fortran' 'readline' 'libx11' 'blas' 'lapack')

source=('https://downloads.sourceforge.net/project/yaehmop/yaehmop-beta/3.1.0b2/bind.3.1.0b2.tgz'
		'https://downloads.sourceforge.net/project/yaehmop/yaehmop-beta/3.1.0b2/viewkel.3.1.0b.tgz'
		'https://downloads.sourceforge.net/project/yaehmop/yaehmop-beta/3.1.0b2/dense_eval.3.1.0b.tgz'
		'yaehmop-fix-build.patch'
		'yaehmop-fix-implicit-declarations.patch'
		'yaehmop-fix-hard-coded-data-paths.patch')

sha256sums=('ce53fdc3adc117df83fcc418e30610d5c56d4af99d34c35757b1374b859b6ccd'
            '5bd5c4e6968bb2231d045ff8f5ef73e6ceb23a1e031b71bcbc7cbb1f9b9baaad'
            '2c3ffbb5775391078993c3ddc330c5bba2af1d737fbbca49822d989cb07fea35'
            '1558b5960a4af51e906a243806bbe8550d4ef7b868b55badb75581bfa744985e'
            '074eab380f4d2d16f24b3600d1a30292683eef8510a85a43f7187d9e153681e9'
            '7418e05a7dcc9355875323203bd8fd382cc5c64afe7e9017597398b21e1f432a')

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
	patch -p1 < "${srcdir}/${source[3]}"
	patch -p1 < "${srcdir}/${source[4]}"
	patch -p1 < "${srcdir}/${source[5]}"
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
	mkdir -p "${pkgdir}/usr/share/${pkgname}/tightbind"
	mkdir -p "${pkgdir}/usr/share/${pkgname}/viewkel"
	cp -rp "${srcdir}/${pkgname}/bin" "${pkgdir}/usr/"
	install -m 644 \
		"${srcdir}/${pkgname}/tightbind/eht_parms.dat" \
		"${srcdir}/${pkgname}/tightbind/muller_parms.dat" \
		"${pkgdir}/usr/share/${pkgname}/tightbind"
	install -m 644 \
		"${srcdir}/${pkgname}/viewkel/new_atomic_parms.dat" \
		"${srcdir}/${pkgname}/viewkel/atomic_parms.dat" \
		"${pkgdir}/usr/share/${pkgname}/viewkel"
}
