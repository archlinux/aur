# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname='omnetpp-qt'
pkgver=5.0
pkgrel=1
_pkgname='omnetpp'
pkgdesc='OMNeT++ Discrete Event Simulator. OMNeT++ is an extensible, modular, component-based C++ simulation library and framework, primarily for building network simulators: QT version'
url='http://www.omnetpp.org'
license=('custom')
depends=(libxml2 qt4 tcl tk blt jdk8-openjdk openmpi libpcap doxygen graphviz osgearth-qt4 openscenegraph-qt4 clang)
makedepends=(sh wget qt4 cmake gcc bison flex perl osgearth-qt4 openscenegraph-qt4)
arch=('i686' 'x86_64')
provides=('omnetpp')
conflicts=('omnetpp')

if [ $(echo "85315492c3863b05be030944c8ae8ba4a20997a8f3673bbeaf5456dd92075ca88eb2babd5f4ab6d012866de9905e0368c929b03cfdccf6d76705b66defb7698c  omnetpp-5.0-src.tgz" | sha512sum -c --status; echo $?) -ne 0 ];
then
	sh download.sh
fi

source=(OMNeT++.desktop
	omnetpp.sh
	download.sh
	omnetpp-5.0-src.tgz::https://omnetpp.org/omnetpp/send/30-omnet-releases/2305-omnetpp-50-linux)

sha512sums=('87dfd78b441c4384f40aa160786ea847b3a7dbef569258311dc03821273f08dc22962747ef7022a1d2f65f422b34d4a909c9eae7deb4dc6839b12b1dbad56e88'
	'facb711a01c41665c7909f82b4cee65ddee232e0c526f754ce1ab148dbc6c65abb9b24255f985be245fb2c33f91623365eac730ef83cb1a7c595a09726856fa1'
	'7e543c381f358fa840726cda4c8feb8773d90e923ce5cdf20a25dcb287cf0ebdfc20fef5cfc43475a859057bff81eecaffe1a12a1e92029b346365e4d62abfc9'
	'85315492c3863b05be030944c8ae8ba4a20997a8f3673bbeaf5456dd92075ca88eb2babd5f4ab6d012866de9905e0368c929b03cfdccf6d76705b66defb7698c')

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
