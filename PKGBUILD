# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Maintainer: Florian Pritz <bluewind@xinu.at>
pkgbase=zabbix-nightly
_base=zabbix
pkgname=(zabbix-nightly-server zabbix-nightly-agent{,2} zabbix-nightly-proxy zabbix-nightly-frontend-php)
pkgver=5.0.0beta1
pkgrel=1
_pre=pre
_git=54e36e1e03
arch=(x86_64)
url='https://www.zabbix.com/'
license=(GPL)
makedepends=(postgresql-libs libxml2 unixodbc net-snmp mariadb-libs libldap libevent go)
conflicts=("zabbix-server" "zabbix-agent" "zabbix-agent2" "zabbix-proxy" "zabbix-frontend-php")
source=(https://www.zabbix.com/downloads/nightly/${_pre}-${_base}-${pkgver}-${_git}.tar.gz
        zabbix-agent.{service,sysusers,tmpfiles}
        zabbix-agent2.service
        zabbix-server{-mysql,-pgsql}.service zabbix-server.{sysusers,tmpfiles}
        zabbix-proxy{-sqlite,-mysql,-pgsql}.service zabbix-proxy.{sysusers,tmpfiles})

sha512sums=('7eda141860f2222ab31b0cb6bb2246a0ab17b798dcc38b603c651a7a3b7ea2182f06558e7822e2153511f69184ce0838e9124a6e6b9417a3278bff841b8057b7'
            '8c1fa2676bc0ef91bc39ec5f97b4d3ba5c365d063420455a3785121a54e120bc5afeacde42a48f4509c115f940dcc3b6c2f43044a7fbfb421182fc93b22a2444'
            '3ab3ac1acc7e35c8896157aef601ebc30815237ac5252cbd0c1ecb26eeaf9eccf5c49938ae8c85bb79a6f95f607f082f6b80ed660829599ec03aa626cca6d3dc'
            'ca6b4779de23829dfdd80ee21e924fbe4e2754f4e693bed4b1a2aa846cd87d150e399b1169d7fe58d30c50ed837c1b8254e580de420267d0a1834d6dc409c43d'
            'c57dfcc13b290f4120d1185339bd2d6b1ea7a2ca0c98dca8632d4fd8fe462a42cb35e8a88895eb8ee390c55cf0ffb90b544f23fefbf059b49c06e5373d0b8af2'
            'b35155a5d151eb7258bca62d53e7099a05605e58adac9d1510e12c2219abc22f931e92ea5d36bf86900e30982e893e429235d983a7823610d76c15082c373d1f'
            'ac968d9954e5d9523eb7a9b8dcbcef40d4b47c1db3b2ff86d5fbc3f1871fcd03aff14f5b0cfeeeb494fdeb2d95e2e32b8622297c714a90d22c68ab3b3b914475'
            '4254d3b13ff0d19a8e207f709c10ea59dbb6d4f333d862b1611a0fa4ced199e9a32313e88d8abadc129c1e4001b182c0545bcc84117d218116a8c524de88850e'
            'b6d548a26f845ef1a39724e3273aa521715272e20a0038144f86d377a26dfec6e3e129404cfda77632cad2f5cd6bab4a33f70a26c8c67b0d0b2abb3678ad2d83'
            '7b5829caa77c6b5da8c2195ab840f0020f722a94f01a437324afdbe2a4372a594dcca6d63d2fdda5cfad81353ab4e4e0b2c6b67436203266dd44740a5e03b58e'
            '94701f34fe5df4859c6a4d0459c16062374e8f89f4f51c414e71c9c2db14f61e087721e68dddb3e8d88bf1c097477c1a21e27ba4705fd07d88c60adb41acc1be'
            'c772a7f7fe5c0715db27a15f8cb1aee7e92677d1fa2d922fae42440cac8c2acc3d3ceba0bb2103fd7907b129618cf50e6a34dd221c8474c9cea9badaeaadf80b'
            '7c1072a8cd5837095f857b50124cb45d1bdbddbce108f6f067a35c3c9ebb1ad0502ef617dfa10f9c843631220177a6286a97b1c2a46539200be72fa83cb23b99'
            '64042ddf511b56b2a5a311e34643f4e049c09d909ea65b7343a8a9637f33dc59f2b1342201290ca0774cbcbf616096b3696982047fb622b7d51afb5eceb298dd')

prepare() {
  cd $_base-$pkgver
  sed -i \
    -e '/^LogFile=.*/d' \
    -e 's/# LogType=file/LogType=system/' \
    conf/zabbix_{agentd,proxy,server}.conf

  autoreconf -fi
}

build() {
  export GOPATH="$srcdir"/go
  export AGENT_LDFLAGS="${LDFLAGS}"

  _configure_flags=(
    --disable-static
    --prefix=/usr
    --infodir=/usr/share/info
    --mandir=/usr/share/man
    --sysconfdir=/etc/zabbix
    --enable-agent
    --enable-agent2
    --enable-ipv6
    --with-ldap
    --with-libcurl
    --with-libxml2
    --with-net-snmp
    --with-openssl
    --with-ssh2
    --with-unixodbc
  )

  cd $_base-$pkgver

  for db in postgresql mysql; do
    ./configure ${_configure_flags[@]} --enable-server --with-$db
    make clean
    make
    mv src/zabbix_server/zabbix_server{,_$db}
  done

  for db in postgresql mysql sqlite3; do
    ./configure ${_configure_flags[@]} --enable-proxy --with-$db
    make clean
    make
    mv src/zabbix_proxy/zabbix_proxy{,_$db}
  done
}

package_zabbix-nightly-server() {
  pkgdesc='Monitoring software for networks and applications, nightly version'
  depends=(net-snmp curl libxml2 unixodbc libldap libevent pcre)
  optdepends=('postgresql-libs: for PostgreSQL support'
              'mariadb-libs: for MariaDB support')
  backup=(etc/zabbix/zabbix_server.conf)
  install=zabbix-server.install

  cd $_base-$pkgver

  for db in postgresql mysql; do
    install -Dm755 src/zabbix_server/zabbix_server_$db \
      "$pkgdir/usr/bin/zabbix_server_$db"

    install -d "$pkgdir/usr/share/$pkgname/$db"
    install -m644 database/$db/*.sql -t "$pkgdir/usr/share/$pkgname/$db"
  done
  install -Dm755 src/zabbix_get/zabbix_get "$pkgdir/usr/bin/zabbix_get"

  install -Dm644 man/zabbix_server.man "$pkgdir/usr/share/man/man8/zabbix_server.8"
  install -Dm644 man/zabbix_get.man "$pkgdir/usr/share/man/man1/zabbix_get.1"

  install -Dm644 conf/zabbix_server.conf "$pkgdir/etc/zabbix/zabbix_server.conf"
  chown 170:170 "$pkgdir/etc/zabbix/zabbix_server.conf"

  install -Dm644 "$srcdir/zabbix-server-pgsql.service" \
    "$pkgdir/usr/lib/systemd/system/zabbix-server-pgsql.service"
  install -Dm644 "$srcdir/zabbix-server-mysql.service" \
    "$pkgdir/usr/lib/systemd/system/zabbix-server-mysql.service"

  install -Dm644 "$srcdir/zabbix-server.sysusers" \
	"$pkgdir/usr/lib/sysusers.d/zabbix-server.conf"
  install -Dm644 "$srcdir/zabbix-server.tmpfiles" \
	"$pkgdir/usr/lib/tmpfiles.d/zabbix-server.conf"
}

package_zabbix-nightly-agent() {
  pkgdesc='Monitoring agent for Zabbix, nightly version'
  depends=(curl pcre)
  backup=(etc/zabbix/zabbix_agentd.conf)

  cd $_base-$pkgver
  install -Dm755 src/zabbix_agent/zabbix_agentd "$pkgdir/usr/bin/zabbix_agentd"
  install -Dm755 src/zabbix_sender/zabbix_sender "$pkgdir/usr/bin/zabbix_sender"

  install -Dm644 conf/zabbix_agentd.conf "$pkgdir/etc/zabbix/zabbix_agentd.conf"
  chown 172:172 "$pkgdir/etc/zabbix/zabbix_agentd.conf"

  install -Dm644 conf/zabbix_agentd/userparameter_examples.conf \
	"$pkgdir/usr/share/zabbix-agent/userparameter_examples.conf"
  install -Dm644 conf/zabbix_agentd/userparameter_mysql.conf \
	"$pkgdir/usr/share/zabbix-agent/userparameter_mysql.conf"

  install -Dm644 man/zabbix_agentd.man \
	"$pkgdir/usr/share/man/man8/zabbix_agentd.8"
  install -Dm644 man/zabbix_sender.man \
	"$pkgdir/usr/share/man/man1/zabbix_sender.1"

  install -Dm644 "$srcdir/zabbix-agent.service" \
	"$pkgdir/usr/lib/systemd/system/zabbix-agent.service"
  install -Dm644 "$srcdir/zabbix-agent.sysusers" \
	"$pkgdir/usr/lib/sysusers.d/zabbix-agent.conf"
  install -Dm644 "$srcdir/zabbix-agent.tmpfiles" \
	"$pkgdir/usr/lib/tmpfiles.d/zabbix-agent.conf"
}

package_zabbix-nightly-agent2() {
  pkgdesc='Experimental monitoring agent for Zabbix (Agent 2), nightly version'
  depends=(zabbix-nightly-agent)
  backup=(etc/zabbix/zabbix_agent2.conf)

  cd $_base-$pkgver
  install -Dm755 src/go/bin/zabbix_agent2 "$pkgdir/usr/bin/zabbix_agent2"
  install -Dm644 src/go/conf/zabbix_agent2.conf "$pkgdir/etc/zabbix/zabbix_agent2.conf"
  chown 172:172 "$pkgdir/etc/zabbix/zabbix_agent2.conf"

  install -Dm644 man/zabbix_agent2.man \
	"$pkgdir/usr/share/man/man8/zabbix_agent2.8"

  install -Dm644 "$srcdir/zabbix-agent2.service" \
	"$pkgdir/usr/lib/systemd/system/zabbix-agent2.service"
}

package_zabbix-nightly-proxy() {
  pkgdesc='Data collecting proxy for Zabbix, nightly version'
  depends=(net-snmp curl libxml2 sqlite unixodbc libldap pcre)
  optdepends=('mariadb-libs: for MariaDB support'
              'postgresql-libs: for PostgreSQL support')
  backup=(etc/zabbix/zabbix_proxy.conf)

  cd $_base-$pkgver
  for db in postgresql mysql sqlite3; do
    install -Dm755 src/zabbix_proxy/zabbix_proxy_$db \
      "$pkgdir/usr/bin/zabbix_proxy_$db"

    install -d "$pkgdir/usr/share/$pkgname/$db"
    install -m644 database/$db/schema.sql -t "$pkgdir/usr/share/$pkgname/$db"
  done
  install -Dm644 conf/zabbix_proxy.conf "$pkgdir/etc/zabbix/zabbix_proxy.conf"
  chown 171:171 "$pkgdir/etc/zabbix/zabbix_proxy.conf"

  install -Dm644 "$srcdir/zabbix-proxy-sqlite.service" \
    "$pkgdir/usr/lib/systemd/system/zabbix-proxy-sqlite.service"
  install -Dm644 "$srcdir/zabbix-proxy-pgsql.service" \
    "$pkgdir/usr/lib/systemd/system/zabbix-proxy-pgsql.service"
  install -Dm644 "$srcdir/zabbix-proxy-mysql.service" \
    "$pkgdir/usr/lib/systemd/system/zabbix-proxy-mysql.service"

  install -Dm644 "$srcdir/zabbix-proxy.sysusers" \
	"$pkgdir/usr/lib/sysusers.d/zabbix-proxy.conf"
  install -Dm644 "$srcdir/zabbix-proxy.tmpfiles" \
	"$pkgdir/usr/lib/tmpfiles.d/zabbix-proxy.conf"
}

package_zabbix-nightly-frontend-php() {
  pkgdesc='PHP frontend for Zabbix, nightly version'
  depends=(zabbix-nightly-server php php-gd)

  cd $_base-$pkgver
  install -d "$pkgdir/usr/share/webapps/zabbix"
  cp -a frontends/php/* "$pkgdir/usr/share/webapps/zabbix"
  chown http:http ${pkgdir}/usr/share/webapps/zabbix/conf/ # write access for http user
}
