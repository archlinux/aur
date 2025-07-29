# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Contributor: Thor K. Høgås <thor that-circular-a roht dot no>

pkgname='omnetpp-preview'
_pkgname='omnetpp'
pkgver=6.2.0pre1
pkgrel=1
pkgdesc='OMNeT++ Discrete Event Simulator. OMNeT++ is an extensible, modular, component-based C++ simulation library and framework, primarily for building network simulators: preview version'
arch=('x86_64')
url='http://www.omnetpp.org'
license=('Academic Public License')
depends=('libxml2'
         'qt5-base'
         'tcl'
         'jdk-openjdk'
         'openmpi'
         'libpcap'
         'doxygen'
         'graphviz'
         'openscenegraph'
         'python-setuptools'
         'python-matplotlib'
         'python-numpy1'
         'python-pandas'
         'python-scipy'
         'python-tzdata'
         'python-posix_ipc')
makedepends=('wget'
             'cmake'
             'clang>=17.0.6'
             'llvm>=17.0.6'
             'llvm-libs>=17.0.6'
             'python-setuptools'
             'python-matplotlib'
             'python-numpy1'
             'python-pandas'
             'python-scipy'
             'python-tzdata'
             'python-posix_ipc'
             'bison'
             'flex'
             'perl')
optdepends=('osgearth: geospatial API with 3D rendering')
provides=('omnetpp')
conflicts=('omnetpp')
install=omnetpp-preview.install
replaces=('omnetpp-qt')

source=(OMNeT++.desktop
        omnetpp.sh
        "${_pkgname}-${pkgver}.tar.gz::https://github.com/omnetpp/omnetpp/archive/refs/tags/omnetpp-${pkgver}.tar.gz")

sha512sums=('a5772a605592ed2db839609f8298d1d71fb9141eb1b30dac584b788414dfe49b250ba803351a3a84f90c6b89f8e09e7b129a037af17c9b94c22dff2003a5edd8'
            'facb711a01c41665c7909f82b4cee65ddee232e0c526f754ce1ab148dbc6c65abb9b24255f985be245fb2c33f91623365eac730ef83cb1a7c595a09726856fa1'
            '5f79f80c592442114bb8e5cf2a98266195717d1fad5b9d2fb7892585c200472ccf6d112533838e016c38128f13614542582ac2d46b914a9808d5a41445caf262')

build() {
	cd ${srcdir}/${_pkgname}-${_pkgname}-${pkgver}
	echo WITH_OSGEARTH=no >> configure.user
	# Fix configure script
	sed -i "2152 a ac_configure_args=$(echo $ac_configure_args | sed s/\'//g)" configure
	source setenv
	./configure --prefix=/opt --libdir=/opt/lib --libexecdir=/opt/lib
	PATH=${srcdir}/${_pkgname}-${_pkgname}-${_pkgver}/bin:$PATH
	LD_LIBRARY_PATH=${srcdir}/${_pkgname}-${_pkgname}-${_pkgver}/lib:$LD_LIBRARY_PATH
  make
}

package() {
	# Install build to /opt
	cd ${srcdir}
	mkdir -p "${pkgdir}"/opt
	mv  "${_pkgname}-${_pkgname}-${pkgver}" ${pkgdir}/opt/${_pkgname} || return 1

	# run OMNeT++ as a normal user
  mkdir -p ${pkgdir}/opt/${_pkgname}/ide
	touch ${pkgdir}/opt/${_pkgname}/ide/error.log
	chmod 777 ${pkgdir}/opt/${_pkgname}/ide/error.log

	# copy profile.d file
	mkdir -p ${pkgdir}/etc/profile.d
	cp omnetpp.sh ${pkgdir}/etc/profile.d/

	# copy desktop shortcut
	mkdir -p ${pkgdir}/usr/share/applications/
	cp OMNeT++.desktop ${pkgdir}/usr/share/applications/

	# Install License
	mkdir -p ${pkgdir}/opt/${_pkgname}/doc
	cd ${pkgdir}/opt/${_pkgname}/doc
	install -D -m644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

