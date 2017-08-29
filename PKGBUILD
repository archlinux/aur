# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
pkgname='omnetpp-qt'
pkgver=5.2pre3
_pkgver=5-2-pre3
__pkgver=5.2
___pkgver=5-2
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

if [ $(echo "0cd282520bf2def1c6d7d75e14777203c64073ef2583cc5c0f353d2834460ffad5d7d6c257727149c5406b3faa17f6edc136b276f6826d921e042fcd1776c9a2  omnetpp-5.2pre3-src-linux.tgz" | sha512sum -c --status; echo $?) -ne 0 ];
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
	omnetpp-5.2pre3-src-linux.tgz::https://omnetpp.org/component/jdownloads/send/31-release-test-versions/2317-omnetpp-5-2-pre3-linux)

sha512sums=('a5772a605592ed2db839609f8298d1d71fb9141eb1b30dac584b788414dfe49b250ba803351a3a84f90c6b89f8e09e7b129a037af17c9b94c22dff2003a5edd8'
  'a5b26871248a4a4c5002b3a121f00b519a1898e4743affe386fd938fa06442ef128442e797097bb8355f80fc3e9ebb3438494d4be9dd27c6efbd42afb1731b8b'
  '5322a1d22f1918f261eb1c312019413698266d82323f45ee37474dac49c525f60bdc9212b91dbea232dc6f31f5c08ef7ed6f8e7f3bd356db704185de89487fc5'
  '799d9aa8ae5d9804706188ff237f9e662e678fd88fb2da45023fe04f71e67e87243f1df4b6a33e9e3c6fd6e6f1309f779b3c3ad7c6d8ff34f9ceb49116ab3558'
  '4c54ffa1e9f645e8af8b5e4cc1da697ab2ab0da5794da67df840c995f0e3378388b498f47e8d9672c1ba08287bcd89dcf2da67330c5e38546c740b041b19227b'
	'facb711a01c41665c7909f82b4cee65ddee232e0c526f754ce1ab148dbc6c65abb9b24255f985be245fb2c33f91623365eac730ef83cb1a7c595a09726856fa1'
	'39c1f51e9a4487b765d575b364e05e4be5e9d002d10d3d3fab4930e0fb659ec4702fcac7922ac124e64a4362154e66e32b5d30e0d69900f1acd904d46bdbd011'
	'0cd282520bf2def1c6d7d75e14777203c64073ef2583cc5c0f353d2834460ffad5d7d6c257727149c5406b3faa17f6edc136b276f6826d921e042fcd1776c9a2')

build() {
	# fix configure bug by providing pre-generated configuration file with --prefix=/opt --libdir=/opt/lib --libexecdir=/opt/lib
	cp config.status ${srcdir}/${_pkgname}-${__pkgver}/
	cp Makefile.inc  ${srcdir}/${_pkgname}-${__pkgver}/
	cp qtenv.pri ${srcdir}/${_pkgname}-${__pkgver}/src/qtenv/
	cp ver.h ${srcdir}/${_pkgname}-${__pkgver}/src/common/
	cd ${srcdir}/${_pkgname}-${__pkgver}
	PATH=${srcdir}/${_pkgname}-${__pkgver}/bin:$PATH
	LD_LIBRARY_PATH=${srcdir}/${_pkgname}-${__pkgver}/lib:$LD_LIBRARY_PATH
	make
}

package() {
	# Install build to /opt
	cd ${srcdir}
	mkdir -p "${pkgdir}"/opt 
	mv  "${_pkgname}-${__pkgver}" ${pkgdir}/opt/${_pkgname} || return 1

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

