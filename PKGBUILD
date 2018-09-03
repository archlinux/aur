# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Please Download latest version directly from Omnet++ Website since no direct access is possible (Captcha Protection Enable) and place it next to PKBBUILD.
# Current link to download: https://www.omnetpp.org/component/jdownloads/summary/31-release-test-versions/2328-omnetpp60-pre2
pkgname='omnetpp-qt'
pkgver=6.0pre2
_pkgver=6-0pre2
pkgrel=1
_pkgname='omnetpp'
pkgdesc='OMNeT++ Discrete Event Simulator. OMNeT++ is an extensible, modular, component-based C++ simulation library and framework, primarily for building network simulators: QT version'
url='http://www.omnetpp.org'
license=('custom')
depends=(libxml2 qt5-base tcl tk blt jdk8-openjdk openmpi libpcap doxygen graphviz clang openscenegraph)
makedepends=(sh wget qt5-base cmake gcc bison flex perl openscenegraph blt)
optdepends=(osgearth)
arch=('i686' 'x86_64')
provides=('omnetpp')
conflicts=('omnetpp')

source=(OMNeT++.desktop
	config.status
	Makefile.inc
	qtenv.pri
  ver.h
	omnetpp.sh
	omnetpp-${pkgver}-src-linux.tgz::https://www.omnetpp.org/component/jdownloads/summary/31-release-test-versions/2328-omnetpp60-pre2)

sha512sums=('a5772a605592ed2db839609f8298d1d71fb9141eb1b30dac584b788414dfe49b250ba803351a3a84f90c6b89f8e09e7b129a037af17c9b94c22dff2003a5edd8'
'5c74d4b593006b3e93c253583ff9115b7b7da2feb48569f7bb9ae6daf45b5e85651c25b8267bb724e4ee366da163634cc1e6206be7ad05d55b8fe94570040249'
'377a311ca1c8abbd6c141403cb418462cb3056593a392708994b52347c35ed64db969f27484e29ddacfe114e1da9156bc2d0ade23cea0519a202f3c81b07e338'
'b4d36b1104b0f341cc133111559ad9af7fb76d80a8281f61ae990e5e0e813fb7bd2ae4a1b73941c53ca87f81b14e5cf7396d1009f4a06d2066910677b73f7d21'
'e638bff972b833c1bf6cec7fa4d36672d526312c6c29136505101fb6b6778da0515238476b1c1f815333a8fc349be9d518d60938259393591ce433d0cb179a66'
'facb711a01c41665c7909f82b4cee65ddee232e0c526f754ce1ab148dbc6c65abb9b24255f985be245fb2c33f91623365eac730ef83cb1a7c595a09726856fa1'
'7515126e9a465fa1bf5a5e705df5501deb9733e9a8d1108da327fbf7f168adb60eae850a76f8f01d555039b3503fa7c2fb5948b798b53abf3061907568300cd5')

build() {
	# fix configure bug by providing pre-generated configuration file with ./configure --prefix=/opt --libdir=/opt/lib --libexecdir=/opt/lib
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

