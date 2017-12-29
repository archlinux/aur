# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
pkgname='omnetpp-qt'
pkgver=5.3p1
_pkgver=5-3p1
pkgrel=1
_pkgname='omnetpp'
pkgdesc='OMNeT++ Discrete Event Simulator. OMNeT++ is an extensible, modular, component-based C++ simulation library and framework, primarily for building network simulators: QT version'
url='http://www.omnetpp.org'
license=('custom')
depends=(libxml2 qt5-base tcl tk blt jdk8-openjdk openmpi libpcap doxygen graphviz clang openscenegraph)
makedepends=(sh wget qt5-base cmake gcc bison flex perl openscenegraph)
arch=('i686' 'x86_64')
provides=('omnetpp')
conflicts=('omnetpp')

if [ $(echo "e67df3e123c370426705a15a0092c7ffe566d36ae5f53b560a8d3a4c31cacf3b727e990639b62a9712063c62bdb48614ae9e6a5ccb40ae948460bba3097d3817 omnetpp-5.3p1-src-linux.tgz" | sha512sum -c --status; echo $?) -ne 0 ];
then
	sh download.sh
fi

source=(OMNeT++.desktop
	config.status
	Makefile.inc
	qtenv.pri
  ver.h
	omnetpp.sh
	download.sh
omnetpp-${pkgver}-src-linux.tgz::https://www.omnetpp.org/component/jdownloads/send/31-release-test-versions/2325-omnetpp-${_pkgver}-linux)

sha512sums=('a5772a605592ed2db839609f8298d1d71fb9141eb1b30dac584b788414dfe49b250ba803351a3a84f90c6b89f8e09e7b129a037af17c9b94c22dff2003a5edd8'
'3c951067d22854e1f355ca8cc8ea7e445abe0f3e9e0d494792046f0c207a50a8dd71e00ca2a2367c3985890f002a701a124cf36665c23ae192c2ecdedf26963b'
'926dda2dbec7ca608699e4be329a5711acc2655cf98701c5197aba20fad7bd204d3ed66df5a7f142c236a12152f66893f7ea3481d355cd4db9e8fbb0158cbff9'
'b4d36b1104b0f341cc133111559ad9af7fb76d80a8281f61ae990e5e0e813fb7bd2ae4a1b73941c53ca87f81b14e5cf7396d1009f4a06d2066910677b73f7d21'
'b1a36b009f6f9d64718cf5bb68c47df38be5993eb4b8b935e9469d5f72ab415e1dea65872ecd313c4847a0afcef2a995edac4ba71a15892cb89f0579ac001cb7'
'facb711a01c41665c7909f82b4cee65ddee232e0c526f754ce1ab148dbc6c65abb9b24255f985be245fb2c33f91623365eac730ef83cb1a7c595a09726856fa1'
'17a231b1b28b1ce6cd616250173a2702db9cd52aff6e6da811511b3b7b5f5dc92de9a64c5f002b13c20c072d03dbd515eff59b60868c39527dbc00411970933d'
'e67df3e123c370426705a15a0092c7ffe566d36ae5f53b560a8d3a4c31cacf3b727e990639b62a9712063c62bdb48614ae9e6a5ccb40ae948460bba3097d3817')

build() {
	# fix configure bug by providing pre-generated configuration file with --prefix=/opt --libdir=/opt/lib --libexecdir=/opt/lib
	cp config.status ${srcdir}/${_pkgname}-${pkgver}/
	cp Makefile.inc  ${srcdir}/${_pkgname}-${pkgver}/
	cp qtenv.pri ${srcdir}/${_pkgname}-${pkgver}/src/qtenv/
	cp ver.h ${srcdir}/${_pkgname}-${pkgver}/src/common/
	cd ${srcdir}/${_pkgname}-${pkgver}
	echo WITH_OSGEARTH=no >> configure.user
	PATH=${srcdir}/${_pkgname}-${pkgver}/bin:$PATH
	LD_LIBRARY_PATH=${srcdir}/${_pkgname}-${pkgver}/lib:$LD_LIBRARY_PATH
	make
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

