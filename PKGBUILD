# Maintainer:  Robin "miup" Cerny <miup@miup.ch>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>

pkgname=(zabbix-agent-lts)
pkgver=4.0.16
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://www.zabbix.com/'
license=(GPL)
source=(https://downloads.sourceforge.net/sourceforge/zabbix/zabbix-${pkgver}.tar.gz
        zabbix-agent.{service,sysusers,tmpfiles})

sha512sums=('e5a0b13790ef082d63c879ebf989739ffde448161d45eb16ccf4100473556ef39d00466687ecce69e3430e54ec32015c2d00461b81f51510d08d8e38284e2ee6'
            '8c1fa2676bc0ef91bc39ec5f97b4d3ba5c365d063420455a3785121a54e120bc5afeacde42a48f4509c115f940dcc3b6c2f43044a7fbfb421182fc93b22a2444'
            '3ab3ac1acc7e35c8896157aef601ebc30815237ac5252cbd0c1ecb26eeaf9eccf5c49938ae8c85bb79a6f95f607f082f6b80ed660829599ec03aa626cca6d3dc'
            'ca6b4779de23829dfdd80ee21e924fbe4e2754f4e693bed4b1a2aa846cd87d150e399b1169d7fe58d30c50ed837c1b8254e580de420267d0a1834d6dc409c43d')

prepare() {
  cd $srcdir/zabbix-$pkgver
  sed -i \
    -e '/^LogFile=.*/d' \
    -e 's/# LogType=file/LogType=system/' \
    conf/zabbix_agentd.conf

  autoreconf -fi
}

build() {
  _configure_flags=(
    --disable-static
    --prefix=/usr
    --infodir=/usr/share/info
    --mandir=/usr/share/man
    --sysconfdir=/etc/zabbix
    --enable-agent
    --enable-ipv6
    --with-ldap
    --with-libcurl
    --with-libxml2
    --with-net-snmp
    --with-openssl
    --with-ssh2
    --with-unixodbc
  )

  cd $srcdir/zabbix-$pkgver
  ./configure ${_configure_flags[@]}
  make clean
  make
}

package_zabbix-agent-lts() {
  pkgdesc='Monitoring agent for Zabbix'
  depends=(curl pcre)
  backup=(etc/zabbix/zabbix_agentd.conf)

  cd $srcdir/zabbix-$pkgver
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

