# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname='omnetpp-qt'
pkgver=5.0
pkgrel=1
_pkgname='omnetpp'
pkgdesc='OMNeT++ Discrete Event Simulator. OMNeT++ is an extensible, modular, component-based C++ simulation library and framework, primarily for building network simulators: QT version'
url='http://www.omnetpp.org'
license=('custom')
depends=(libxml2 qt4 tcl tk blt jdk8-openjdk openmpi openscenegraph libpcap doxygen graphviz osgearth-qt4 openscenegraph-qt4 clang)
makedepends=(sh wget qt4 cmake gcc bison flex perl osgearth-qt4 openscenegraph-qt4)
arch=('i686' 'x86_64')
provides=('omnetpp')
conflicts=('omnetpp')

if [ $(echo "55dc13b719666c22f20bcd8d166a4c9aad38f29d3c02548df7771f6ea870a928  omnetpp-5.0-src.tgz" | sha256sum -c --status; echo $?) -ne 0 ];
then
	echo "Downloading file omnetpp-5.0-src.tgz with wget"
	sh download.sh
fi

source=(OMNeT++.desktop
	omnetpp.sh
	download.sh
	omnetpp-5.0-src.tgz::https://omnetpp.org/omnetpp/send/30-omnet-releases/2305-omnetpp-50-linux)

sha256sums=('fe0660d45f8320378a9d3d1f0ed421e952d9fd5be8a6df6d72845a654d94b5d4'
	'2e921bc540c09c9cf16a49a632fe399808ba798576967be4b078055a365f087e'
	'af925e9a553e799123992050fb8d4c2c28ab4eb42f436a5e25d904b230a5eaf2'
	'55dc13b719666c22f20bcd8d166a4c9aad38f29d3c02548df7771f6ea870a928')
build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	PATH=${srcdir}/${_pkgname}-${pkgver}/bin:$PATH
	LD_LIBRARY_PATH=${srcdir}/${_pkgname}-${pkgver}/lib:$LD_LIBRARY_PATH
	./configure --prefix=/opt --libdir=/opt/lib --libexecdir=/opt/lib && make
}
package() {
	# Install build to /opt
	cd ${srcdir}
	mkdir -p "${pkgdir}"/opt 
	mv  "${_pkgname}-${pkgver}" ${pkgdir}/opt/${_pkgname} || return 1

	# run OMNeT++ as a normal user
	touch ${pkgdir}/opt/${_pkgname}/ide/error.log
	chmod 777 ${pkgdir}/opt/${_pkgname}/ide/error.log

	# copy profile.d file
	mkdir -p ${pkgdir}/etc/profile.d/
	cp omnetpp.sh ${pkgdir}/etc/profile.d/
	
	# copy desktop shortcut
	mkdir -p ${pkgdir}/usr/share/applications/
	cp OMNeT++.desktop ${pkgdir}/usr/share/applications/

	# Install License
	cd ${pkgdir}/opt/${_pkgname}/doc
	install -D -m644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
