# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgbase=kamailio
pkgname=('kamailio' 'kamailio-autheph-modules' 'kamailio-berkeley-modules' 'kamailio-cnxcc-modules'
         'kamailio-cpl-modules' 'kamailio-dnssec-modules' 'kamailio-erlang-modules' 'kamailio-extra-modules'
         'kamailio-geoip-modules' 'kamailio-geoip2-modules' 'kamailio-ims-modules' 'kamailio-json-modules'
         'kamailio-kazoo-modules' 'kamailio-ldap-modules' 'kamailio-lua-modules' 'kamailio-memcached-modules'
         'kamailio-mongodb-modules' 'kamailio-mono-modules' 'kamailio-mysql-modules' 'kamailio-outbound-modules'
         'kamailio-perl-modules' 'kamailio-phonenum-modules' 'kamailio-postgres-modules'
         'kamailio-presence-modules' 'kamailio-python-modules' 'kamailio-python3-modules'
         'kamailio-rabbitmq-modules' 'kamailio-radius-modules' 'kamailio-redis-modules' 'kamailio-ruby-modules'
         'kamailio-sctp-modules' 'kamailio-snmpstats-modules' 'kamailio-sqlite-modules'
         'kamailio-systemd-modules' 'kamailio-tls-modules' 'kamailio-unixodbc-modules' 'kamailio-utils-modules'
         'kamailio-websocket-modules' 'kamailio-xml-modules' 'kamailio-xmpp-modules')
pkgver=5.2.1
pkgrel=1
pkgdesc="Rock solid SIP server"
url="http://www.kamailio.org/"
license=('GPL2')
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
makedepends=('flex' 'bison' 'docbook2x' 'pcre' 'python2' 'python' 'openssl' 'db' 'libxml2' 'hiredis' 'libevent'
             'dnssec-tools' 'expat' 'libunistring' 'libev' 'jansson' 'geoip' 'libmaxminddb' 'curl' 'unixodbc'
             'json-c' 'librabbitmq-c' 'libldap' 'lua' 'libmemcached' 'mongo-c-driver' 'snappy' 'mono'
             'mariadb-clients' 'perl' 'erlang' 'libphonenumber' 'postgresql' 'sqlite' 'net-snmp' 'lksctp-tools'
             'ruby' 'freeradius-client')
source=("http://www.kamailio.org/pub/${pkgbase}/${pkgver}/src/${pkgbase}-${pkgver}_src.tar.gz"
        "${pkgname}.service")
sha256sums=('95d2158f97c76124a381364d99de1420f193275c5a1c9f88489c6409702f2c8f'
            'bd434a9b71fc65483f4844c2d75b6f3d5cc5278569d6b14614f42241a6eb2b56')

prepare() {
  cd "${pkgbase}-${pkgver}"
  sed -i 's/bin_dir = sbin\//bin_dir = bin\//g' src/Makefile.defs
}

build() {
  cd "${pkgbase}-${pkgver}"

  make FLAVOUR=kamailio STUN=1 \
    PREFIX=/usr \
    CC_EXTRA_OPTS="$CFLAGS -D_GNU_SOURCE" \
    LD_EXTRA_OPTS="$LDFLAGS" \
    cfg_target=/etc/kamailio/ \
    run_prefix="" \
    group_include="kstandard" \
    LIBDIR=lib \
    DESTDIR="${pkgdir}" \
    cfg_prefix="${pkgdir}" \
    cfg

  make EMBEDDED_UTF8_DECODE=1 STUN=1 FREERADIUS=1 all


  modules="kradius kldap kmysql kpostgres kunixodbc kxml kperl kcpl kxmpp kberkeley kutils kmemcached \
           ktls kwebsocket ksnmpstats kpresence klua kpython kpython3 kruby kgeoip ksqlite kjson \
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
  make DESTDIR="${pkgdir}" install group_include="kstandard"
  install -Dm0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

package_kamailio-autheph-modules() {
  depends=('kamailio' 'openssl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kautheph"
}

package_kamailio-berkeley-modules() {
  depends=('kamailio' 'db')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kberkeley"
}

package_kamailio-cnxcc-modules() {
  depends=('kamailio' 'hiredis' 'libevent')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kcnxcc"
}

package_kamailio-cpl-modules() {
  depends=('kamailio' 'libxml2')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kcpl"
}

package_kamailio-dnssec-modules() {
  depends=('kamailio' 'dnssec-tools')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kdnssec"
}

package_kamailio-erlang-modules() {
  depends=('kamailio')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kerlang"
}

package_kamailio-extra-modules() {
  depends=('kamailio' 'libevent' 'libev' 'jansson' 'curl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kgzcompress kev kuuid kjansson khttp_async"
}

package_kamailio-geoip-modules() {
  depends=('kamailio' 'geoip')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kgeoip"
}

package_kamailio-geoip2-modules() {
  depends=('kamailio' 'libmaxminddb')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kgeoip2"
}

package_kamailio-ims-modules() {
  depends=('kamailio' 'libmnl' 'libxml2')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kims"
}

package_kamailio-json-modules() {
  depends=('kamailio' 'libevent' 'json-c')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kjson"
}

package_kamailio-kazoo-modules() {
  depends=('kamailio' 'libevent' 'json-c' 'librabbitmq-c')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kkazoo"
}

package_kamailio-ldap-modules() {
  depends=('kamailio' 'libldap')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kldap"
}

package_kamailio-lua-modules() {
  depends=('kamailio' 'lua')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="klua"
}

package_kamailio-memcached-modules() {
  depends=('kamailio' 'libmemcached')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kmemcached"
}

package_kamailio-mongodb-modules() {
  depends=('kamailio' 'mongo-c-driver' 'openssl' 'snappy')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kmongodb"
}

package_kamailio-mono-modules() {
  depends=('kamailio' 'mono')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kmono"
}

package_kamailio-mysql-modules() {
  depends=('kamailio' 'mariadb-clients')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kmysql"
}

package_kamailio-outbound-modules() {
  depends=('kamailio' 'openssl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="koutbound"
}

package_kamailio-perl-modules() {
  depends=('kamailio' 'perl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kperl"
}

package_kamailio-phonenum-modules() {
  depends=('kamailio' 'libphonenumber')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kphonenum"
}

package_kamailio-postgres-modules() {
  depends=('kamailio' 'postgresql')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kpostgres"
}

package_kamailio-presence-modules() {
  depends=('kamailio' 'libxml2' 'curl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kpresence"
}

package_kamailio-python-modules() {
  depends=('kamailio' 'python2')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kpython"
}

package_kamailio-python3-modules() {
  depends=('kamailio' 'python')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kpython3"
}

package_kamailio-rabbitmq-modules() {
  depends=('kamailio' 'librabbitmq-c')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="krabbitmq"
}

package_kamailio-radius-modules() {
  depends=('kamailio' 'freeradius-client')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} FREERADIUS=1 install-modules-all group_include="kradius"
}

package_kamailio-redis-modules() {
  depends=('kamailio' 'hiredis')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kredis"
}

package_kamailio-ruby-modules() {
  depends=('kamailio' 'ruby')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kruby"
}

package_kamailio-sctp-modules() {
  depends=('kamailio' 'lksctp-tools')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="ksctp"
}

package_kamailio-snmpstats-modules() {
  depends=('kamailio' 'net-snmp')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="ksnmpstats"
}

package_kamailio-sqlite-modules() {
  depends=('kamailio' 'sqlite')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="ksqlite"
}

package_kamailio-systemd-modules() {
  depends=('kamailio')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="ksystemd"
}

package_kamailio-tls-modules() {
  depends=('kamailio' 'openssl' 'curl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="ktls"
}

package_kamailio-unixodbc-modules() {
  depends=('kamailio' 'unixodbc' 'libunistring')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kunixodbc"
}

package_kamailio-utils-modules() {
  depends=('kamailio' 'libxml2' 'curl')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kutils"
}

package_kamailio-websocket-modules() {
  depends=('kamailio' 'openssl' 'libunistring')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kwebsocket"
}

package_kamailio-xml-modules() {
  depends=('kamailio' 'libxml2')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kxml"
}

package_kamailio-xmpp-modules() {
  depends=('kamailio' 'expat')
  cd "${pkgbase}-${pkgver}"
  make DESTDIR=${pkgdir} install-modules-all group_include="kxmpp"
}

# vim:set ts=2 sw=2 et:
