# Maintainer: Thor K. Høgås <thor that-circular-a roht dot no>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Yunhui Fu (yhfudev@gmail.com)
# Contributor: Julien Sopena (jsopena.archlinux@free.fr)
# Contributor: Oleg Smirnov (oleg.smirnov@gmail.com)
# Contributor: angrycore (angrycore@gmail.com)
# Contributor: Christophe Guéret (christophe.gueret@gmail.com)
# Contributor: oguzkagan <me at oguzkaganeren dot com dot tr>
# Contributor: a32633 <brunofernandes@ua.pt>

pkgname='omnetpp'
pkgver=6.0.3
pkgrel=1
pkgdesc='Component-based simulation package designed for modeling communication networks'
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
         'python-scipy'
         'python-pandas'
         'python-posix_ipc')
makedepends=('wget'
             'cmake'
             'clang>=17.0.6'
             'llvm>=17.0.6'
             'llvm-libs>=17.0.6'
             'bison'
             'flex'
             'perl')
optdepends=(
			'python-numpy: analysing simulation recordings'
			'python-matplotlib: analysing simulation recordings'
			'python-pandas: analysing simulation recordings'
			'osgearth: geospatial API with 3D rendering')
provides=('omnetpp')
conflicts=('omnetpp')
install=${pkgname}.install

source=(
  ${pkgname}-${pkgver}-src-linux.tgz::"https://github.com/omnetpp/omnetpp/releases/download/omnetpp-${pkgver}/omnetpp-${pkgver}-linux-x86_64.tgz"
  OMNeT++.desktop
  omnetpp.sh)

sha512sums=('93cd5068aac8e5579728b304cdd5b593ae8e1a6ee108d80abb394dfb70ecc0c3d2255816f3620a7a80cf1846f031218ddec0d5b66805d1dcd52ba9759cccf281'
  '064bb4747e9985dab8480de69978e2258111a38a7d49bb24c36f1ac070058bb2149bb4d2b2fd15d5a35f0ce02bf47e1d212a74397afd07a40a68b5eab7decfd1'
  'facb711a01c41665c7909f82b4cee65ddee232e0c526f754ce1ab148dbc6c65abb9b24255f985be245fb2c33f91623365eac730ef83cb1a7c595a09726856fa1')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	echo WITH_OSGEARTH=no >> configure.user
	# Fix configure script
	sed -i "2152 a ac_configure_args=$(echo $ac_configure_args | sed s/\'//g)" configure
	source setenv
	./configure --prefix=/opt --libdir=/opt/lib --libexecdir=/opt/lib
	PATH=${srcdir}/${pkgname}-${pkgver}/bin:$PATH
	LD_LIBRARY_PATH=${srcdir}/${pkgname}-${pkgver}/lib:$LD_LIBRARY_PATH
	make -j2
}

package() {
	# Install build to /opt
	cd ${srcdir}
	mkdir -p "${pkgdir}"/opt
	mv  "${pkgname}-${pkgver}" ${pkgdir}/opt/${pkgname} || return 1

	# run OMNeT++ as a normal user
	touch ${pkgdir}/opt/${pkgname}/ide/error.log
	chmod 777 ${pkgdir}/opt/${pkgname}/ide/error.log

	# copy profile.d file
	mkdir -p ${pkgdir}/etc/profile.d/
	cp omnetpp.sh ${pkgdir}/etc/profile.d/

	# copy desktop shortcut
	mkdir -p ${pkgdir}/usr/share/applications/
	cp OMNeT++.desktop ${pkgdir}/usr/share/applications/

	# Install License
	cd ${pkgdir}/opt/${pkgname}/doc
	install -D -m644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
