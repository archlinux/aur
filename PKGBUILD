# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname='omnetpp-qt'
pkgver=5.1
_pkgver=5-1
pkgrel=1
_pkgname='omnetpp'
pkgdesc='OMNeT++ Discrete Event Simulator. OMNeT++ is an extensible, modular, component-based C++ simulation library and framework, primarily for building network simulators: QT version'
url='http://www.omnetpp.org'
license=('custom')
depends=(libxml2 qt5-base tcl tk blt jdk8-openjdk openmpi libpcap doxygen graphviz osgearth openscenegraph clang)
makedepends=(sh wget qt5-base cmake gcc bison flex perl osgearth openscenegraph)
arch=('i686' 'x86_64')
provides=('omnetpp')
conflicts=('omnetpp')

if [ $(echo "c569f4abb829ffd603ddafe588487893295f16f27ff52de143aca24080dafe282a2e24fa047745cc7f6963c3be5db761ca9f288c41887331e62f21ebc4416eb3 omnetpp-5.1-src-linux.tgz" | sha512sum -c --status; echo $?) -ne 0 ];
then
	sh download.sh
fi

source=(OMNeT++.desktop
	ver.h
	config.status
	Makefile.inc
	qtenv.pri
	omnetpp.sh
	download.sh
	omnetpp-5.1-src-linux.tgz::https://omnetpp.org/omnetpp/send/30-omnet-releases/2309-omnetpp-5-1-linux)

sha512sums=('a5772a605592ed2db839609f8298d1d71fb9141eb1b30dac584b788414dfe49b250ba803351a3a84f90c6b89f8e09e7b129a037af17c9b94c22dff2003a5edd8'
	'a1d41e71e2ec1a35ac6e3879eb21b2c7891a762f782fbaa425c8a423815672226c116fae8a934c3bf8a665c96fdfc61083ab5a390b277fcb6ed115da3c314a76'
	'021d93c3dd606f3d8ed7df0fa77142108cc5a6e43929d6db729ad74948decaccda4f33f271f6714e23c566ed377f8cf0f18c244c549e20a9617eb852fc41c510'
	'd52d6cfa2f156f8262a88364932a4b3429e51962e6707ea6330b179fd21e70a6a2afa4805bc2f40c34192ac6e47237f07f1db1ca46b3f5243b4c99a51107b256'
	'799d9aa8ae5d9804706188ff237f9e662e678fd88fb2da45023fe04f71e67e87243f1df4b6a33e9e3c6fd6e6f1309f779b3c3ad7c6d8ff34f9ceb49116ab3558'
	'facb711a01c41665c7909f82b4cee65ddee232e0c526f754ce1ab148dbc6c65abb9b24255f985be245fb2c33f91623365eac730ef83cb1a7c595a09726856fa1'
	'559f43976959b0456bb21601b84df3ab690c734b6b0dcb2b5f564b9e061a3e3a824b8bd5844b1922e6302f4918146620160617feec442f956449fc7c07fb244a'
	'c569f4abb829ffd603ddafe588487893295f16f27ff52de143aca24080dafe282a2e24fa047745cc7f6963c3be5db761ca9f288c41887331e62f21ebc4416eb3')

build() {
	# fix configure bug by providing pre-generated configuration file with --prefix=/opt --libdir=/opt/lib --libexecdir=/opt/lib
	cp config.status ${srcdir}/${_pkgname}-${pkgver}/
	cp Makefile.inc  ${srcdir}/${_pkgname}-${pkgver}/
	cp qtenv.pri ${srcdir}/${_pkgname}-${pkgver}/src/qtenv/
	cp ver.h ${srcdir}/${_pkgname}-${pkgver}/src/common/
	cd ${srcdir}/${_pkgname}-${pkgver}
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
