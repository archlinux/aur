# Contributor: Michael Spradling <mike@mspradling.com>
# Maintainer: Michael Spradling <mike@mspradling.com>
pkgname=emq
pkgver=2.3.9
pkgrel=1
pkgdesc="emqtt: The Massively Scalable MQTT Broker for IoT and Mobile Applications"
url="http://emqtt.io"
license=('GPL')
arch=('x86_64' 'i686')
backup=('etc/emqttd/emq.conf' 'etc/emqttd/acl.conf' 'etc/emqttd/plugins/ekka.conf.example' 'etc/emqttd/plugins/ekka.config.example' 'etc/emqttd/plugins/emq_auth_clientid.conf' 'etc/emqttd/plugins/emq_auth_http.conf' 'etc/emqttd/plugins/emq_auth_jwt.conf' 'etc/emqttd/plugins/emq_auth_ldap.conf' 'etc/emqttd/plugins/emq_auth_mongo.conf' 'etc/emqttd/plugins/emq_auth_mysql.conf' 'etc/emqttd/plugins/emq_auth_pgsql.conf' 'etc/emqttd/plugins/emq_auth_redis.conf' 'etc/emqttd/plugins/emq_auth_username.conf' 'etc/emqttd/plugins/emq_coap.conf' 'etc/emqttd/plugins/emq_dashboard.conf' 'etc/emqttd/plugins/emq_lua_hook.conf' 'etc/emqttd/plugins/emq_modules.conf' 'etc/emqttd/plugins/emq_plugin_template.config' 'etc/emqttd/plugins/emq_recon.conf' 'etc/emqttd/plugins/emq_reloader.conf' 'etc/emqttd/plugins/emq_retainer.conf' 'etc/emqttd/plugins/emq_sn.conf' 'etc/emqttd/plugins/emq_stomp.conf' 'etc/emqttd/plugins/emq_web_hook.conf')
depends=('erlang' 'rebar')
source=("${pkgname}::git+https://github.com/emqtt/emq-relx.git#tag=v${pkgver}" 'emq.service' '0001-Update-vars-for-build.patch')
md5sums=('SKIP' '50c106030b0fb71dfe64e9fa939a0595' '53da2693269a9de92bf6b3497d2995f3')
install=emqttd.install

prepare() {
	cd "$pkgname"
	patch -Np1 -i "${srcdir}/0001-Update-vars-for-build.patch"
}

build() {
	cd "$pkgname"
	# parallel builds are broken
	make -j1
}

package() {
	cd "$pkgname"

	mkdir -p $pkgdir/etc/emqttd
	mkdir -p $pkgdir/usr/lib/emqttd
	mkdir -p $pkgdir/var/lib/emqttd
	mkdir -p $pkgdir/var/log/emqttd
	mkdir -p $pkgdir/run/emqttd
	mkdir    $pkgdir/usr/lib/emqttd/bin
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib/systemd/system


	cp -R _rel/emqttd/lib $pkgdir/usr/lib/emqttd
	cp -R _rel/emqttd/erts-* $pkgdir/usr/lib/emqttd
	cp -R _rel/emqttd/releases $pkgdir/usr/lib/emqttd

	# Executables
	install -p -D -m 0755 _rel/emqttd/bin/emqttd $pkgdir/usr/bin
	install -p -D -m 0755 _rel/emqttd/bin/emqttd_ctl $pkgdir/usr/bin
	cp _rel/emqttd/bin/cuttlefish $pkgdir/usr/lib/emqttd/bin
	cp _rel/emqttd/bin/install_upgrade_escript $pkgdir/usr/lib/emqttd/bin
	cp _rel/emqttd/bin/nodetool $pkgdir/usr/lib/emqttd/bin
	cp _rel/emqttd/bin/start_clean.boot $pkgdir/usr/lib/emqttd/bin

	# Config files
	cp -R _rel/emqttd/etc/* $pkgdir/etc/emqttd

	mkdir -p $pkgdir/var/lib/emqttd

	cp -R _rel/emqttd/data/* $pkgdir/var/lib/emqttd

	cp $srcdir/emq.service $pkgdir/usr/lib/systemd/system
}
