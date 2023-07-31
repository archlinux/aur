# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=ha-glue
pkgver=1.0.12
pkgrel=8
pkgdesc="A set of libraries, tools and utilities suitable for the Heartbeat/Pacemaker cluster stack."
arch=('i686' 'x86_64')
url="https://github.com/ClusterLabs/cluster-glue"
license=('GPL')
depends=('net-snmp' 
	'python2' 
	'libxml2' 
	'libtool' 
	'util-linux' 
	'curl' 
	'glib2'
	'asciidoc')
source=("https://github.com/ClusterLabs/cluster-glue/archive/refs/tags/glue-${pkgver}.tar.gz")
md5sums=('2164cfd6a491e749eaa722f70a25b749')
options=('!libtool' 'docs')

build() {
	_CLUSTER_USER=hacluster
	_CLUSTER_GROUP=haclient

	cd "${srcdir}/cluster-glue-glue-${pkgver}"
	sed -i 's/<glib\/gtypes\.h>/<glib\.h>/g' include/clplumbing/cl_uuid.h
	./autogen.sh
	./configure  --prefix=/usr \
		--sbindir=/usr/bin \
		--libdir=/usr/lib \
		--localstatedir=/var \
		--libexecdir=/usr/lib \
		--with-daemon-user=${_CLUSTER_USER} \
		--with-daemon-group=${_CLUSTER_GROUP} \
		--enable-fatal-warnings=no
	# Fight unused direct deps
	sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool
	make
}

package() {
	cd "${srcdir}/cluster-glue-glue-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# conflicts with pacemaker (which has a better version)
	rm -f "$pkgdir/usr/bin/cibsecret"

	#python path correction
	for py in `grep -r -l "\#\!\/usr\/bin\/python" ${pkgdir}`;do
		sed -i 's:/usr/bin/python$:/usr/bin/python2:g' ${py}
	done 
	for py in `grep -r -l "\#\!\/usr\/bin\/env python" ${pkgdir}`;do
		sed -i 's:/usr/bin/env python$:/usr/bin/env python2:g' ${py}
	done
	#end python path correction
	install -Dm644 /dev/null "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	cat>"$pkgdir/usr/lib/sysusers.d/$pkgname.conf"<<-EOF
		g haclient 189
		u hacluster 189:189 "cluster user" / /sbin/nologin
	EOF
}

