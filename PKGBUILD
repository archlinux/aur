# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgbase=kamailio
pkgname=("${pkgbase}" "${pkgbase}-autheph-modules" "${pkgbase}-berkeley-modules" "${pkgbase}-cnxcc-modules"
  "${pkgbase}-cpl-modules" "${pkgbase}-dnssec-modules" "${pkgbase}-erlang-modules" "${pkgbase}-extra-modules"
  "${pkgbase}-geoip-modules" "${pkgbase}-geoip2-modules" "${pkgbase}-ims-modules" "${pkgbase}-json-modules"
  "${pkgbase}-kazoo-modules" "${pkgbase}-ldap-modules" "${pkgbase}-lua-modules" "${pkgbase}-memcached-modules"
  "${pkgbase}-mongodb-modules" "${pkgbase}-mono-modules" "${pkgbase}-mysql-modules" "${pkgbase}-outbound-modules"
  "${pkgbase}-perl-modules" "${pkgbase}-phonenum-modules" "${pkgbase}-postgres-modules"
  "${pkgbase}-presence-modules" "${pkgbase}-python-modules"
  "${pkgbase}-rabbitmq-modules" "${pkgbase}-radius-modules" "${pkgbase}-redis-modules" "${pkgbase}-ruby-modules"
  "${pkgbase}-sctp-modules" "${pkgbase}-snmpstats-modules" "${pkgbase}-sqlite-modules"
  "${pkgbase}-systemd-modules" "${pkgbase}-tls-modules" "${pkgbase}-unixodbc-modules" "${pkgbase}-utils-modules"
  "${pkgbase}-websocket-modules" "${pkgbase}-xml-modules" "${pkgbase}-xmpp-modules")
pkgver=5.5.3
pkgrel=1
pkgdesc="The Open Source SIP Server"
url="https://${pkgbase}.org"
license=('GPL2')
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
makedepends=('flex' 'bison' 'docbook2x' 'pcre' 'python' 'openssl' 'db' 'libxml2' 'hiredis' 'libevent'
  'dnssec-tools' 'expat' 'libunistring' 'libev' 'jansson' 'geoip' 'libmaxminddb' 'unixodbc'
  'json-c' 'librabbitmq-c' 'libldap' 'lua' 'libmemcached' 'mongo-c-driver' 'snappy' 'mono'
  'mariadb-clients' 'perl' 'erlang' 'libphonenumber' 'postgresql' 'sqlite' 'net-snmp' 'lksctp-tools'
  'ruby' 'freeradius-client')
source=("${url}/pub/${pkgbase}/${pkgver}/src/${pkgbase}-${pkgver}_src.tar.gz"
  "${pkgname}.service")
sha512sums=('dc0f8e9b8f95f679ab9f85dc8bed867ddd0764cb61ff767c37eaddf1cb62b13c7a1f9bc03821db29bc81ad1e77447637e19330dfcd701e7d240b68c9d0acb81a'
  'f68404e92c974e8b1794b175e94bcd97da40d02d027b80ea8bb683a427af6663ae137ff98932226b437fd3a6e75e5a1beeccaea5f0449d8708bebfa7e7b8a4c4')

prepare() {
  cd "${pkgbase}-${pkgver}"
  sed -i 's/bin_dir = sbin\//bin_dir = bin\//g' src/Makefile.defs
}

build() {
  cd "${pkgbase}-${pkgver}"

  make FLAVOUR=${pkgbase} STUN=1 \
    PREFIX=/usr \
    CC_EXTRA_OPTS="$CFLAGS -D_GNU_SOURCE" \
    LD_EXTRA_OPTS="$LDFLAGS" \
    cfg_target=/etc/${pkgbase}/ \
    run_prefix="" \
    group_include="kstandard" \
    LIBDIR=lib \
    DESTDIR="${pkgdir}" \
    cfg_prefix="${pkgdir}" \
    cfg

  make EMBEDDED_UTF8_DECODE=1 STUN=1 FREERADIUS=1 all

  modules="kradius kldap kmysql kpostgres kunixodbc kxml kperl kcpl kxmpp kberkeley kutils kmemcached \
           ktls kwebsocket ksnmpstats kpresence klua kpython kruby kgeoip ksqlite kjson \
           kredis kmono kims koutbound kdnssec ksctp kautheph kgzcompress kuuid kev kkazoo kmongodb kcnxcc \
           kjansson kgeoip2 kerlang ksystemd khttp_async krabbitmq kphonenum"

  for module in ${modules}; do
    make EMBEDDED_UTF8_DECODE=1 STUN=1 FREERADIUS=1 every-module group_include=${module}
  done
}

package_kamailio() {
  depends=('pcre' 'python')
  backup=('etc/kamailio/kamctlrc' 'etc/kamailio/kamailio.cfg')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" cfg_prefix="${pkgdir}" install group_include="kstandard"
  install -Dm0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

package_kamailio-autheph-modules() {
  pkgdesc="Ephemeral authentication module for Kamailio"
  depends=('kamailio' 'openssl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kautheph"
}

package_kamailio-berkeley-modules() {
  pkgdesc="Berkeley database module for Kamailio"
  depends=('kamailio' 'db')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kberkeley"
}

package_kamailio-cnxcc-modules() {
  pkgdesc="cnxcc call charging control module for Kamailio"
  depends=('kamailio' 'hiredis' 'libevent')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kcnxcc"
}

package_kamailio-cpl-modules() {
  pkgdesc="CPL (Call Processing Language) interpreter for Kamailio"
  depends=('kamailio' 'libxml2')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kcpl"
}

package_kamailio-dnssec-modules() {
  pkgdesc="DNSSEC module for Kamailio"
  depends=('kamailio' 'dnssec-tools')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kdnssec"
}

package_kamailio-erlang-modules() {
  pkgdesc="Erlang node interaction module for Kamailio"
  depends=('kamailio')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kerlang"
}

package_kamailio-extra-modules() {
  pkgdesc="gzcompress, ev, uuid, jansson and http_async modules for Kamailio"
  depends=('kamailio' 'libevent' 'libev' 'jansson' 'curl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kgzcompress kev kuuid kjansson khttp_async"
}

package_kamailio-geoip-modules() {
  pkgdesc="GeoIP module for Kamailio"
  depends=('kamailio' 'geoip')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kgeoip"
}

package_kamailio-geoip2-modules() {
  pkgdesc="GeoIP2 module for Kamailio"
  depends=('kamailio' 'libmaxminddb')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kgeoip2"
}

package_kamailio-ims-modules() {
  pkgdesc="Various Diameter interfaces and modules for Kamailio to run as an IMS core"
  depends=('kamailio' 'libmnl' 'libxml2')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kims"
}

package_kamailio-json-modules() {
  pkgdesc="JSON parser module for Kamailio"
  depends=('kamailio' 'libevent' 'json-c')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kjson"
}

package_kamailio-kazoo-modules() {
  pkgdesc="Kazoo application server integration module for Kamailio"
  depends=('kamailio' 'libevent' 'json-c' 'librabbitmq-c')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kkazoo"
}

package_kamailio-ldap-modules() {
  pkgdesc="Ldap and h350 modules for Kamailio"
  depends=('kamailio' 'libldap')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kldap"
}

package_kamailio-lua-modules() {
  pkgdesc="Lua extension module for Kamailio"
  depends=('kamailio' 'lua')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="klua"
}

package_kamailio-memcached-modules() {
  pkgdesc="memcached module for Kamailio"
  depends=('kamailio' 'libmemcached')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kmemcached"
}

package_kamailio-mongodb-modules() {
  pkgdesc="Mongodb database driver and non-db connector for Kamailio"
  depends=('kamailio' 'mongo-c-driver' 'openssl' 'snappy')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kmongodb"
}

package_kamailio-mono-modules() {
  pkgdesc="Mono extension module for Kamailio"
  depends=('kamailio' 'mono')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kmono"
}

package_kamailio-mysql-modules() {
  pkgdesc="MySQL database driver for Kamailio"
  depends=('kamailio' 'mariadb-clients')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kmysql"
}

package_kamailio-outbound-modules() {
  pkgdesc="SIP outbound extension module for Kamailio"
  depends=('kamailio' 'openssl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="koutbound"
}

package_kamailio-perl-modules() {
  pkgdesc="Perl modules for Kamailio"
  depends=('kamailio' 'perl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kperl"
}

package_kamailio-phonenum-modules() {
  pkgdesc="libphonenumber module for Kamailio"
  depends=('kamailio' 'libphonenumber')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kphonenum"
}

package_kamailio-postgres-modules() {
  pkgdesc="PostgreSQL database driver for Kamailio"
  depends=('kamailio' 'postgresql')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kpostgres"
}

package_kamailio-presence-modules() {
  pkgdesc="presence modules for Kamailio"
  depends=('kamailio' 'libxml2' 'curl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kpresence"
}

package_kamailio-python-modules() {
  pkgdesc="Python extension module for Kamailio"
  depends=('kamailio' 'python')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kpython"
}

package_kamailio-rabbitmq-modules() {
  pkgdesc="RabbitMQ module for Kamailio"
  depends=('kamailio' 'librabbitmq-c')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="krabbitmq"
}

package_kamailio-radius-modules() {
  pkgdesc="RADIUS modules for Kamailio"
  depends=('kamailio' 'freeradius-client')
  backup=('etc/kamailio/dictionary.kamailio')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" FREERADIUS=1 install-modules-all group_include="kradius"
}

package_kamailio-redis-modules() {
  pkgdesc="Redis NOSQL database driver for Kamailio"
  depends=('kamailio' 'hiredis')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kredis"
}

package_kamailio-ruby-modules() {
  pkgdesc="Ruby extension module for Kamailio"
  depends=('kamailio' 'ruby')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kruby"
}

package_kamailio-sctp-modules() {
  pkgdesc="SCTP SIP transport module for Kamailio"
  depends=('kamailio' 'lksctp-tools')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="ksctp"
}

package_kamailio-snmpstats-modules() {
  pkgdesc="snmpstats module for Kamailio"
  depends=('kamailio' 'net-snmp')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="ksnmpstats"
}

package_kamailio-sqlite-modules() {
  pkgdesc="SQLite database driver for Kamailio"
  depends=('kamailio' 'sqlite')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="ksqlite"
}

package_kamailio-systemd-modules() {
  pkgdesc="systemd modules for Kamailio"
  depends=('kamailio')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="ksystemd"
}

package_kamailio-tls-modules() {
  pkgdesc="TLS modules for Kamailio"
  depends=('kamailio' 'openssl' 'curl')
  backup=('etc/kamailio/tls.cfg')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="ktls"
}

package_kamailio-unixodbc-modules() {
  pkgdesc="unixODBC database driver for Kamailio"
  depends=('kamailio' 'unixodbc' 'libunistring')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kunixodbc"
}

package_kamailio-utils-modules() {
  pkgdesc="Utility modules for Kamailio"
  depends=('kamailio' 'libxml2' 'curl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kutils"
}

package_kamailio-websocket-modules() {
  pkgdesc="WebSocket modules for Kamailio"
  depends=('kamailio' 'openssl' 'libunistring')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kwebsocket"
}

package_kamailio-xml-modules() {
  pkgdesc="xml modules for Kamailio"
  depends=('kamailio' 'libxml2')
  backup=('etc/kamailio/pi_framework.xml')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kxml"
}

package_kamailio-xmpp-modules() {
  pkgdesc="SIP to XMPP IM translator module for Kamailio"
  depends=('kamailio' 'expat')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} cfg_prefix="${pkgdir}" install-modules-all group_include="kxmpp"
}
