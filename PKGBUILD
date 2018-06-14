# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
pkgname='omnetpp-qt'
pkgver=5.4
_pkgver=5-4
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

if [ $(echo "72529f945019d011aa7255f22db9e99b5eef7047943fa42e1d657ad67dabccf3b4dd557046636b8e15a29948b230984a365f282bfbf86eff6bc2297722e94231 omnetpp-5.4-src-linux.tgz" | sha512sum -c --status; echo $?) -ne 0 ];
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
omnetpp-${pkgver}-src-linux.tgz::https://www.omnetpp.org/component/jdownloads/send/31-release-test-versions/2331-omnetpp-${_pkgver}-linux)

sha512sums=('a5772a605592ed2db839609f8298d1d71fb9141eb1b30dac584b788414dfe49b250ba803351a3a84f90c6b89f8e09e7b129a037af17c9b94c22dff2003a5edd8'
'94f08a8e03e441a4609d0bfb35b92b4c8c702b7e3f9f39f2455572ef8e50894be781cc33792d50a730e801f232457f140b944f49931910e0d6c7f00b45d0b618'
'325fd32ca57295ae1968e356146942753d450b167e5b506ff8e802839d525a4e45e91ed2fcbd069ba8ba23ba7903c7a938c2c8276d6eb22428d06a8670a00c97'
'b4d36b1104b0f341cc133111559ad9af7fb76d80a8281f61ae990e5e0e813fb7bd2ae4a1b73941c53ca87f81b14e5cf7396d1009f4a06d2066910677b73f7d21'
'c33f06978b91b57b16244ceef7296609f93195ec4a99be98d42fdfb68f223fff26de66aacd0165e94f212bae7b9f5b622c512e92265c660a356195ca876a717d'
'facb711a01c41665c7909f82b4cee65ddee232e0c526f754ce1ab148dbc6c65abb9b24255f985be245fb2c33f91623365eac730ef83cb1a7c595a09726856fa1'
'6104720105bc1bc3903e3530281cbced5ad7a973c9d3e65150ae87418316b1f9b54e02462988d040eb28709cd44adeb3ee5ca74f29e353dd55a9daa0199f52a2'
'72529f945019d011aa7255f22db9e99b5eef7047943fa42e1d657ad67dabccf3b4dd557046636b8e15a29948b230984a365f282bfbf86eff6bc2297722e94231')

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

