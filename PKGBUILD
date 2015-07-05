# Maintainer: gls < ghostlovescorebg at gmail dot com >

pkgname=ha-glue
pkgver=1.0.12
pkgrel=1
pkgdesc="A set of libraries, tools and utilities suitable for the Heartbeat/Pacemaker cluster stack."
arch=('i686' 'x86_64')
url="http://linux-ha.org/wiki/Cluster_Glue"
license=('GPL')
depends=('net-snmp' 
	'python2' 
	'libxml2' 
	'libtool' 
	'util-linux-ng' 
	'curl' 
	'glib2'
	'asciidoc')
source=("http://hg.linux-ha.org/glue/archive/glue-${pkgver}.tar.bz2"
		"ha-glue.install")
md5sums=('ec620466d6f23affa3b074b72bca7870'
         'b3e3b0e1f6d0e1e6748c1d463d9f3bf4')
install='ha-glue.install'
options=('!libtool' 'docs')

build() {
	_CLUSTER_USER=hacluster
	_CLUSTER_GROUP=haclient
	_PREFIXETC=/etc
	_PREFIXINIT=${_PREFIXETC}/rc.d
	_PREFIXVAR=/var
	_DGID=666
	_DUID=666

	#verify the cluster user and group
	if ! getent group ${_CLUSTER_GROUP} >/dev/null;then
		echo -e "\nBEFORE COMPILE THIS SOFTWARE YOU MUST CREATE A CLUSTER GROUP, EXECUTE AS ROOT:"
		echo -e "groupadd -r -g ${_DGID} ${_CLUSTER_GROUP}\n"
		_EXITCODE=1
	fi
	if ! getent passwd ${_CLUSTER_USER} >/dev/null;then
		echo -e "\nBEFORE COMPILE THIS SOFTWARE YOU MUST CREATE A CLUSTER USER, EXECUTE AS ROOT:"
		echo -e "useradd -r -g ${_CLUSTER_GROUP} -u ${_DUID} -d /var/lib/heartbeat/cores/hacluster -s /sbin/nologin -c \"cluster user\" ${_CLUSTER_USER}\n"
		_EXITCODE=1
	fi
	if [[ $_EXITCODE -eq 1 ]] ;then
		return 1 
	fi

	cd "${srcdir}/Reusable-Cluster-Components-glue--glue-${pkgver}"
	sed -i 's/<glib\/gtypes\.h>/<glib\.h>/g' include/clplumbing/cl_uuid.h
	./autogen.sh
	./configure  --sbindir=/usr/bin --libdir=/usr/lib --with-daemon-user=${_CLUSTER_USER} --with-daemon-group=${_CLUSTER_GROUP} --enable-fatal-warnings=no
	#sed -i 's/lib64\ //g' configure.ac
	make
}

package() {
	cd "${srcdir}/Reusable-Cluster-Components-glue--glue-${pkgver}"
	make DESTDIR="${pkgdir}" install

	#python path correction
	for py in `grep -r -l "\#\!\/usr\/bin\/python" ${pkgdir}`;do
		sed -i 's:/usr/bin/python$:/usr/bin/python2:g' ${py}
	done 
	for py in `grep -r -l "\#\!\/usr\/bin\/env python" ${pkgdir}`;do
		sed -i 's:/usr/bin/env python$:/usr/bin/env python2:g' ${py}
	done
	#end python path correction
}

