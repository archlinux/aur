# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: SanskritFritz (gmail)

pkgname=netdata-git
_gitname=netdata
pkgver=v1.9.0.r709.g8476fa89
pkgrel=1
pkgdesc="Real-time performance monitoring, in the greatest possible detail, over the web"
url="https://github.com/firehol/netdata/wiki"
arch=('x86_64')
license=('GPL')
depends=('libmnl' 'libnetfilter_acct' 'zlib')
optdepends=('nodejs: for monitoring named and SNMP devices'
            'lm_sensors: for monitoring hardware sensors'
            'iproute2: for monitoring Linux QoS'
            'python: for most of the external plugins'
            'python-psycopg2: for monitoring PostgreSQL databases'
            'python-requests: for monitoring elasticsearch'
            'hddtemp: for monitoring hhd temperature'
            'apcupsd: for monitoring APC UPS'
            'iw: for monitoring Linux as access point')
source=("$_gitname::git+https://github.com/firehol/netdata"
        "${_gitname}.tmpfiles"
        "${_gitname}.sysusers")
provides=('netdata')
conflicts=('netdata')
install="$_gitname.install"
sha512sums=('SKIP'
            '3f934ddd1f5248f9e11c29050c023d60b76e4098ec9c8d413bb362d43e9242f767fd58310d966076e8400779af8bda2459afcc314b267fcb9f1c84173e14e313'
            'a910809a823ba58ca7bdaa72e8d68427b48f452c1fbb2343fa182ecb0a091a7640e73af24b8ba2fdd90e00aed8ef53b7fccd25cb8f04ca9b9fa6c8e52223ca66')

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --libexecdir="/usr/lib" \
    --localstatedir="/var" \
    --with-zlib --with-math --with-user=netdata
  make
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir" install

  # Remove /var/*, pacman creates it via tmpfiles hook
  rm -vrf "${pkgdir}/var"
  touch "$pkgdir/etc/netdata/netdata.conf"
  chown -R 134:134 "$pkgdir"/etc/netdata
  chown -R 134:134 "$pkgdir"/usr/share/netdata/web

  install -Dm0644 "system/netdata.service" "$pkgdir/usr/lib/systemd/system/netdata.service"
  install -Dm0644 "system/netdata.logrotate" "$pkgdir/etc/logrotate.d/netdata"
  install -Dm0644 "${srcdir}/${_gitname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_gitname}.conf"
  install -Dm0644 "${srcdir}/${_gitname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_gitname}.conf"
}

backup=(
  etc/netdata/charts.d/apache.conf
  etc/netdata/charts.d/apcupsd.conf
  etc/netdata/charts.d/cpufreq.conf
  etc/netdata/charts.d/exim.conf
  etc/netdata/charts.d/libreswan.conf
  etc/netdata/charts.d/load_average.conf
  etc/netdata/charts.d/mysql.conf
  etc/netdata/charts.d/nut.conf
  etc/netdata/charts.d/phpfpm.conf
  etc/netdata/charts.d/sensors.conf
  etc/netdata/charts.d/tomcat.conf
  etc/netdata/charts.d/ap.conf
  etc/netdata/charts.d/cpu_apps.conf
  etc/netdata/charts.d/example.conf
  etc/netdata/charts.d/hddtemp.conf
  etc/netdata/charts.d/mem_apps.conf
  etc/netdata/charts.d/nginx.conf
  etc/netdata/charts.d/opensips.conf
  etc/netdata/charts.d/postfix.conf
  etc/netdata/charts.d/squid.conf
  etc/netdata/health.d/apache.conf
  etc/netdata/health.d/backend.conf
  etc/netdata/health.d/beanstalkd.conf
  etc/netdata/health.d/bind_rndc.conf
  etc/netdata/health.d/btrfs.conf
  etc/netdata/health.d/ceph.conf
  etc/netdata/health.d/cpu.conf
  etc/netdata/health.d/couchdb.conf
  etc/netdata/health.d/disks.conf
  etc/netdata/health.d/elasticsearch.conf
  etc/netdata/health.d/entropy.conf
  etc/netdata/health.d/fping.conf
  etc/netdata/health.d/fronius.conf
  etc/netdata/health.d/haproxy.conf
  etc/netdata/health.d/httpcheck.conf
  etc/netdata/health.d/ipc.conf
  etc/netdata/health.d/ipfs.conf
  etc/netdata/health.d/ipmi.conf
  etc/netdata/health.d/isc_dhcpd.conf
  etc/netdata/health.d/lighttpd.conf
  etc/netdata/health.d/mdstat.conf
  etc/netdata/health.d/memcached.conf
  etc/netdata/health.d/memory.conf
  etc/netdata/health.d/mongodb.conf
  etc/netdata/health.d/mysql.conf
  etc/netdata/health.d/named.conf
  etc/netdata/health.d/net.conf
  etc/netdata/health.d/netfilter.conf
  etc/netdata/health.d/nginx.conf
  etc/netdata/health.d/nginx_plus.conf
  etc/netdata/health.d/portcheck.conf
  etc/netdata/health.d/postgres.conf
  etc/netdata/health.d/qos.conf
  etc/netdata/health.d/ram.conf
  etc/netdata/health.d/redis.conf
  etc/netdata/health.d/retroshare.conf
  etc/netdata/health.d/softnet.conf
  etc/netdata/health.d/squid.conf
  etc/netdata/health.d/stiebeleltron.conf
  etc/netdata/health.d/swap.conf
  etc/netdata/health.d/tcp_conn.conf
  etc/netdata/health.d/tcp_listen.conf
  etc/netdata/health.d/tcp_mem.conf
  etc/netdata/health.d/tcp_orphans.conf
  etc/netdata/health.d/tcp_resets.conf
  etc/netdata/health.d/udp_errors.conf
  etc/netdata/health.d/varnish.conf
  etc/netdata/health.d/web_log.conf
  etc/netdata/health.d/zfs.conf
  etc/netdata/apps_groups.conf
  etc/netdata/charts.d.conf
  etc/netdata/python.d/apache.conf
  etc/netdata/python.d/beanstalk.conf
  etc/netdata/python.d/bind_rndc.conf
  etc/netdata/python.d/ceph.conf
  etc/netdata/python.d/chrony.conf
  etc/netdata/python.d/couchdb.conf
  etc/netdata/python.d/cpufreq.conf
  etc/netdata/python.d/dns_query_time.conf
  etc/netdata/python.d/dnsdist.conf
  etc/netdata/python.d/dovecot.conf
  etc/netdata/python.d/elasticsearch.conf
  etc/netdata/python.d/example.conf
  etc/netdata/python.d/exim.conf
  etc/netdata/python.d/fail2ban.conf
  etc/netdata/python.d/freeradius.conf
  etc/netdata/python.d/go_expvar.conf
  etc/netdata/python.d/haproxy.conf
  etc/netdata/python.d/hddtemp.conf
  etc/netdata/python.d/httpcheck.conf
  etc/netdata/python.d/icecast.conf
  etc/netdata/python.d/ipfs.conf
  etc/netdata/python.d/isc_dhcpd.conf
  etc/netdata/python.d/mdstat.conf
  etc/netdata/python.d/memcached.conf
  etc/netdata/python.d/mongodb.conf
  etc/netdata/python.d/mysql.conf
  etc/netdata/python.d/nginx.conf
  etc/netdata/python.d/nginx_plus.conf
  etc/netdata/python.d/nsd.conf
  etc/netdata/python.d/ntpd.conf
  etc/netdata/python.d/ovpn_status_log.conf
  etc/netdata/python.d/phpfpm.conf
  etc/netdata/python.d/portcheck.conf
  etc/netdata/python.d/postfix.conf
  etc/netdata/python.d/postgres.conf
  etc/netdata/python.d/powerdns.conf
  etc/netdata/python.d/rabbitmq.conf
  etc/netdata/python.d/redis.conf
  etc/netdata/python.d/retroshare.conf
  etc/netdata/python.d/samba.conf
  etc/netdata/python.d/sensors.conf
  etc/netdata/python.d/springboot.conf
  etc/netdata/python.d/squid.conf
  etc/netdata/python.d/smartd_log.conf
  etc/netdata/python.d/tomcat.conf
  etc/netdata/python.d/traefik.conf
  etc/netdata/python.d/varnish.conf
  etc/netdata/python.d/web_log.conf
  etc/netdata/fping.conf
  etc/netdata/node.d.conf
  etc/netdata/python.d.conf
  etc/netdata/health_alarm_notify.conf
  etc/netdata/health_email_recipients.conf
  etc/netdata/stream.conf
  etc/netdata/statsd.d/example.conf
  etc/netdata/netdata.conf
)
