# Maintainer: Yunhui Fu (yhfudev@gmail.com)
# Contributor: Julien Sopena (jsopena.archlinux@free.fr)
# Contributor: Oleg Smirnov (oleg.smirnov@gmail.com)
# Contributor: angrycore (angrycore@gmail.com)
# Contributor: Christophe Guéret (christophe.gueret@gmail.com)

pkgname="omnetpp"
pkgver=5.0
pkgrel=1
pkgdesc="Component-based simulation package designed for modeling communication networks"
url="http://www.omnetpp.org"
license=("Academic Public License")
depends=(tcl tk blt)
makedepends=(libxml2 bison flex)
arch=('i686' 'x86_64')
optdepends=('openmpi: message passing library for parallel simulation',
  'openjdk6: Java runtime for using OMNeT++/OMNEST IDE')
install=${pkgname}.install
_pkgname="omnetpp"
source=(
    omnetpp-5.0-src.tgz::https://omnetpp.org/omnetpp/send/30-omnet-releases/2305-omnetpp-50-linux
    OMNeT++.desktop
    )
md5sums=('91f9540077d719e693610d70244d8661'
         '4e51f984f1a7114ab1f0b6f88fa4e0bc')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	PATH=${srcdir}/${_pkgname}-${pkgver}/bin:$PATH
	LD_LIBRARY_PATH=${srcdir}/${_pkgname}-${pkgver}/lib:$LD_LIBRARY_PATH
	
	sed -i 's!OMNETPP_ROOT/images!OMNETPP_ROOT/images;/usr/share/omnetpp/images!' configure*

	./configure --prefix=/usr

	sed -i 's!IDEDIR=.*!IDEDIR=/opt/omnetpp/ide!' src/utils/omnetpp src/utils/omnest
	sed -i 's!osgi.instance.area.default=.*$!#osgi.instance.area.default=/usr/share/omnetpp/samples!g' ide/configuration/config.ini

	make || return 1
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	mkdir -p ${pkgdir}/usr/bin
	install -m755 bin/* ${pkgdir}/usr/bin

	sed "s|${srcdir}/${_pkgname}-${pkgver}|/usr|g" -i ${pkgdir}/usr/bin/opp_makemake
	sed "s|OMNETPP_INCL_DIR=/usr/include|OMNETPP_INCL_DIR=/usr/include/omnetpp|" -i ${pkgdir}/usr/bin/opp_makemake

	mkdir -p ${pkgdir}/usr/lib
	install lib/gcc/* ${pkgdir}/usr/lib

	mkdir -p ${pkgdir}/usr/include/omnetpp
	mkdir -p ${pkgdir}/usr/include/omnetpp/platdep
	install -m644 include/*.h ${pkgdir}/usr/include/omnetpp
	install -m644 include/platdep/*.h ${pkgdir}/usr/include/omnetpp/platdep
	
	install -d ${pkgdir}/usr/share/omnetpp/{images,doc,samples}
	cp -R images/* ${pkgdir}/usr/share/omnetpp/images
	cp -R doc/* ${pkgdir}/usr/share/omnetpp/doc
	cp -R samples/* ${pkgdir}/usr/share/omnetpp/samples

	install -d ${pkgdir}/usr/share/emacs/site-lisp
	install -m644 contrib/emacs/ned-mode.el ${pkgdir}/usr/share/emacs/site-lisp
	install -m644 contrib/emacs/ini-mode.el ${pkgdir}/usr/share/emacs/site-lisp

	install -d ${pkgdir}/opt/omnetpp
	cp -R ide ${pkgdir}/opt/omnetpp
	touch ${pkgdir}/opt/omnetpp/ide/error.log
	chmod a+rw ${pkgdir}/opt/omnetpp/ide/error.log
	
	mkdir -p ${pkgdir}/usr/share/icons/
	cp ${srcdir}/omnetpp-${pkgver}/ide/icon.png ${pkgdir}/usr/share/icons/omnetpp.png
	
	mkdir -p ${pkgdir}/usr/share/applications/
	cd ${srcdir}
	cp OMNeT++.desktop ${pkgdir}/usr/share/applications/
}
