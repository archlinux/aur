# Maintainer: gls < ghostlovescorebg at gmail dot com >

pkgname=ha-pacemaker-crmsh
pkgver=1.2.6
pkgrel=1
_pkgname=crmsh
pkgdesc="Pacemaker Configuration Shell - The original shell from SUSE"
arch=('i686' 'x86_64')
url="https://savannah.nongnu.org/projects/crmsh/"
license=('GPL')
makedepends=('ha-pacemaker-git' 'python2')
depends=('ha-glue' 'ha-heartbeat' 'libxslt' 'ha-pacemaker-git' 'python2')
source=("http://download.savannah.gnu.org/releases/crmsh/crmsh-1.2.6.tar.bz2")
md5sums=('b3cdfc87ad04b65e367b1f462b31208b')
options=('!libtool' 'docs' 'strip')

build() {
	unset LDFLAGS
	_CLUSTER_USER=hacluster
	_CLUSTER_GROUP=haclient
	_PREFIX=/usr
	_PREFIXETC=/etc
	_PREFIXINIT=${_PREFIXETC}/rc.d
	_PREFIXVAR=/var
	_LCRSODIR=${_PREFIX}/lib/lcrso
	cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
	./autogen.sh
	PYTHON="/usr/bin/python2" ./configure \
		--sbindir=/usr/bin \
		--localstatedir=${_PREFIXVAR} \
		--sysconfdir=${_PREFIXETC}
	make
}

package() {
	cd ${srcdir}/${_pkgname}-${_pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
	
	#fix python
	sed -i 's:/usr/bin/python$:/usr/bin/python2:g' ${pkgdir}/usr/bin/crm
	#cp ${srcdir}/crm2 ${pkgdir}/usr/sbin/crm2
	#chmod 755 ${pkgdir}/usr/sbin/crm2
	#chown root:root ${pkgdir}/usr/sbin/crm2
}
