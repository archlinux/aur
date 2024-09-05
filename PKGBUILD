# Maintainer: omgold@aur
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=ha-glue
pkgver=1.0.13
pkgrel=1
pkgdesc="A set of libraries, tools and utilities suitable for the Heartbeat/Pacemaker cluster stack."
arch=('i686' 'x86_64')
url="https://github.com/ClusterLabs/cluster-glue"
license=('GPL')
depends=(
	'python'
	'libxml2'
	'libtool'
	'util-linux'
	'curl'
	'glib2'
)
makedepends=(
    'openipmi'
    'net-snmp'
    'asciidoc'
)
optdepends=(
    'openipmi: for stonith plugin ipmilan'
    'net-snmp: for stonith plugins rackpdu, apcmastersnmp, wti_mpc'
)
source=("git+https://github.com/ClusterLabs/cluster-glue#commit=4017c21066663960687f30cb8a7dddd24c364767")
sha256sums=(SKIP)
options=('!libtool' 'docs')

build() {
	_CLUSTER_USER=hacluster
	_CLUSTER_GROUP=haclient

	cd "${srcdir}/cluster-glue"
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
	cd "${srcdir}/cluster-glue"
	make DESTDIR="${pkgdir}" install

	# conflicts with pacemaker (which has a better version)
	rm -f "$pkgdir/usr/bin/cibsecret"

	install -Dm644 /dev/null "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	cat>"$pkgdir/usr/lib/sysusers.d/$pkgname.conf"<<-EOF
		g haclient 189
		u hacluster 189:189 "cluster user" / /sbin/nologin
	EOF
}

