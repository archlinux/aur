# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

# You MUST manually download acml-5-3-1-ifort-64bit.tgz from here: http://developer.amd.com/tools-and-sdks/cpu-development/amd-core-math-library-acml/acml-downloads-resources/
# I recommend downloading it to the directory specified by SRCDEST in /etc/makepkg.conf

pkgname=acml-ifort
pkgver=5.3.1
pkgrel=3
pkgdesc="AMD Core Math Library (ACML) for Linux built with Intel Fortran"
arch=("x86_64")
url="http://developer.amd.com"
license=(custom)
depends=("gcc-libs" "bash" "tcsh")
options=('staticlibs')
source=("http://developer.amd.com/tools-and-sdks/cpu-development/amd-core-math-library-acml/acml-downloads-resources/acml-5-3-1-ifort-64bit.tgz")
sha1sums=('1db417d4b49c0e2e892af7ec0ae4514cf5b98672')

prepare() {

	# Extract
	mkdir ${srcdir}/acml
	gzip -dc "${srcdir}/contents-acml-5-3-1-ifort-64bit.tgz" | tar oxvf - -C "${srcdir}/acml"

}

build() {

	_fma4_compat=`${srcdir}/acml/util/cpuid.exe | grep FMA4`
	if [[ "$_fma4_compat" == *not* ]]
	then
	_fma4=''
	else
	_fma4='_fma4'
	fi
	
	find ${srcdir}/acml/ifort64${_fma4}/examples -type f -exec sed -i "/ACMLDIR \(:*\)=/c ACMLDIR := ${srcdir}/acml/ifort64${_fma4}/" {} \;
	find ${srcdir}/acml/ifort64${_fma4}_mp/examples -type f -exec sed -i "/ACMLDIR \(:*\)=/c ACMLDIR := ${srcdir}/acml/ifort64${_fma4}_mp/" {} \;
	find ${srcdir}/acml -type f -exec sed -i "/doplot \(:*\)=/c doplot := 0" {} \;

#	cd ${srcdir}/acml/ifort64${_fma4}/examples
#	make
#	cd ${srcdir}/acml/ifort64${_fma4}/examples/performance
#	make
#
#	cd ${srcdir}/acml/ifort64${_fma4}_mp/examples
#	make
#	cd ${srcdir}/acml/ifort64${_fma4}_mp/examples/performance
#	make

	find ${srcdir}/acml -type f -exec sed -i "/doplot \(:*\)=/c doplot := 1" {} \;
	find ${srcdir}/acml -type f -exec sed -i "/ACMLDIR \(:*\)=/c ACMLDIR := /usr" {} \;
	find ${srcdir}/acml -type f -exec sed -i 's^$(ACMLDIR)/lib^$(ACMLDIR)/lib/acml^g' {} \;
	find ${srcdir}/acml -type f -exec sed -i 's^$(ACMLDIR)/include^$(ACMLDIR)/include/acml^g' {} \;
}
package(){

	mkdir -p $pkgdir/usr/share/licenses/acml-ifort
	mkdir -p $pkgdir/usr/include/acml/ifort
	mkdir -p $pkgdir/usr/lib/acml/ifort
	mkdir -p $pkgdir/opt/acml/ifort

	cp ${srcdir}/acml/ifort64${_fma4}/include/*		${pkgdir}/usr/include/acml/ifort/
	cp ${srcdir}/acml/ifort64${_fma4}/lib/*			${pkgdir}/usr/lib/acml/ifort/
	cp ${srcdir}/acml/ifort64${_fma4}_mp/lib/*		${pkgdir}/usr/lib/acml/ifort/

	cp -r ${srcdir}/acml/ifort64${_fma4}/examples		${pkgdir}/opt/acml/ifort/examples
	cp -r ${srcdir}/acml/ifort64${_fma4}_mp/examples	${pkgdir}/opt/acml/ifort/examples_mp

	cp -r ${srcdir}/acml/Doc 				${pkgdir}/opt/acml/ifort/
	cp -r ${srcdir}/acml/util				${pkgdir}/opt/acml/ifort/
	cp ${srcdir}/acml/ReleaseNotes				${pkgdir}/opt/acml/ifort/
	install -D -m644 ${srcdir}/acml/ACML-EULA.txt		${pkgdir}/usr/share/licenses/acml-ifort/LICENSE
	find "$pkgdir/opt/acml/" -type f -exec chmod 644 {} \;
        find "$pkgdir/opt/acml/" -type d -exec chmod 755 {} \;
	chmod a+x ${pkgdir}/opt/acml/ifort/util/*
	chown -R root:root "$pkgdir"

}
