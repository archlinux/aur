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
pkgver=6.2.0
_pkgver=6.2.0
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
         'python-setuptools'
         'python-matplotlib'
         'python-numpy1'
         'python-pandas'
         'python-scipy'
         'python-tzdata'
         'python-posix_ipc'
         'ipython')
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
             'perl'
             'ipython')
optdepends=('osgearth: geospatial API with 3D rendering')
provides=('omnetpp')
conflicts=('omnetpp')
install=${pkgname}.install

source=(
  ${pkgname}-${pkgver}-src-linux.tgz::"https://github.com/omnetpp/omnetpp/releases/download/omnetpp-${pkgver}/omnetpp-${pkgver}-linux-x86_64.tgz"
  OMNeT++.desktop
  omnetpp.sh)

sha512sums=('6c8eeeeab0760084361220935c35da7423c99d18cd2b49a36c9cf82d27363e3b9522d6b60a9a679d2b3856bae6772e36d628ba76923cfc79ec30c577107df4e6'
  '064bb4747e9985dab8480de69978e2258111a38a7d49bb24c36f1ac070058bb2149bb4d2b2fd15d5a35f0ce02bf47e1d212a74397afd07a40a68b5eab7decfd1'
  'facb711a01c41665c7909f82b4cee65ddee232e0c526f754ce1ab148dbc6c65abb9b24255f985be245fb2c33f91623365eac730ef83cb1a7c595a09726856fa1')

build() {
	cd ${srcdir}/${pkgname}-${_pkgver}
	echo WITH_OSGEARTH=no >> configure.user
	# Fix configure script
	sed -i "2152 a ac_configure_args=$(echo $ac_configure_args | sed s/\'//g)" configure
	source setenv
	./configure --prefix=/opt --libdir=/opt/lib --libexecdir=/opt/lib
	PATH=${srcdir}/${pkgname}-${_pkgver}/bin:$PATH
	LD_LIBRARY_PATH=${srcdir}/${pkgname}-${_pkgver}/lib:$LD_LIBRARY_PATH
  make
}

package() {
	# Install build to /opt
	cd ${srcdir}
	mkdir -p "${pkgdir}"/opt
	mv "${pkgname}-${_pkgver}" ${pkgdir}/opt/${pkgname} || return 1

	# run OMNeT++ as a normal user
	mkdir -p ${pkgdir}/opt/${pkgname}/ide
	touch ${pkgdir}/opt/${pkgname}/ide/error.log
	chmod 777 ${pkgdir}/opt/${pkgname}/ide/error.log

	# copy profile.d file
	mkdir -p ${pkgdir}/etc/profile.d
	cp omnetpp.sh ${pkgdir}/etc/profile.d/

	# copy desktop shortcut
	mkdir -p ${pkgdir}/usr/share/applications/
	cp OMNeT++.desktop ${pkgdir}/usr/share/applications/

	# Install License
	mkdir -p ${pkgdir}/opt/${pkgname}/doc
	cd ${pkgdir}/opt/${pkgname}/doc
	install -D -m644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

