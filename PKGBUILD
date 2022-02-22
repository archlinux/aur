# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Contributor: Thor K. Høgås <thor that-circular-a roht dot no>

pkgname='omnetpp-preview'
pkgver=6.0rc1
pkgrel=1
_pkgname='omnetpp'
pkgdesc='OMNeT++ Discrete Event Simulator. OMNeT++ is an extensible, modular, component-based C++ simulation library and framework, primarily for building network simulators: preview version'
url='http://www.omnetpp.org'
license=('custom')
depends=(libxml2 qt5-base tcl jdk-openjdk openmpi libpcap doxygen graphviz clang openscenegraph python-scipy python-pandas python-posix_ipc)
makedepends=(sh wget cmake bison flex perl python-scipy python-pandas python-posix_ipc)
optdepends=(
			'python-numpy: analysing simulation recordings' 
			'python-matplotlib: analysing simulation recordings'
			'python-pandas: analysing simulation recordings'
			'python-posix_ipc: analysing simulation recordings'
			'osgearth')
arch=('i686' 'x86_64')
provides=('omnetpp')
conflicts=('omnetpp')
replaces=('omnetpp-qt')
install=omnetpp-preview.install

source=(OMNeT++.desktop
        omnetpp.sh
        "${_pkgname}-${pkgver}-src-linux.tgz::https://github.com/omnetpp/omnetpp/releases/download/omnetpp-${pkgver}/omnetpp-${pkgver}-linux-x86_64.tgz")

sha512sums=('a5772a605592ed2db839609f8298d1d71fb9141eb1b30dac584b788414dfe49b250ba803351a3a84f90c6b89f8e09e7b129a037af17c9b94c22dff2003a5edd8'
            'facb711a01c41665c7909f82b4cee65ddee232e0c526f754ce1ab148dbc6c65abb9b24255f985be245fb2c33f91623365eac730ef83cb1a7c595a09726856fa1'
            '1190add3007499e86fe10daa29ddbdbd56ec2aba8dce865db978414f87fd022b4c07b890fa6efe911c6cdaf8775612c7da855c84bd33544855bb4245c6b16a44')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	echo WITH_OSGEARTH=no >> configure.user
	# Fix configure script
	sed -i "2152 a ac_configure_args=$(echo $ac_configure_args | sed s/\'//g)" configure
	source setenv
	./configure --prefix=/opt --libdir=/opt/lib --libexecdir=/opt/lib
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

