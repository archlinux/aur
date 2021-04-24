# Maintainer: RubenKelevra
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=netdata-cloud
_pkgbasename=netdata
pkgver=1.30.1
pkgrel=0
_libmosquitto_version="v.1.6.8_Netdata-5"
pkgdesc="Real-time performance monitoring, in the greatest possible detail, over the web. Cloud enabled edition"
url="https://github.com/netdata/netdata"
arch=('x86_64')
license=('GPL')
backup=('etc/netdata/netdata.conf')
depends=('libmnl' 'libnetfilter_acct' 'zlib' 'judy' 'libuv' 'json-c' 'libcap' 'lz4' 'openssl' 'which' 'snappy' 'protobuf'
         'libwebsockets' 'mongo-c-driver')
makedepends=('cups')
optdepends=('nodejs: for monitoring named and SNMP devices'
            'lm_sensors: for monitoring hardware sensors'
            'iproute2: for monitoring Linux QoS'
            'python: for most of the external plugins'
            'python-psycopg2: for monitoring PostgreSQL databases'
            'python-mysqlclient: for monitoring MySQL/MariaDB databases'
            'python-requests: for monitoring elasticsearch'
            'hddtemp: for monitoring hhd temperature'
            'apcupsd: for monitoring APC UPS'
            'cups: for CUPS plugin'
            'iw: for monitoring Linux as access point')
provides=('netdata')
conflicts=('netdata' 'netdata-git')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/netdata/netdata/releases/download/v${pkgver}/netdata-v${pkgver}.tar.gz"
        "https://github.com/netdata/mosquitto/releases/download/v.1.6.8_Netdata-5/libmosquitto-${_libmosquitto_version}-linux-amd64.tar.gz"
        "$pkgname.sysusers")
sha512sums=('c3d116bf3459ca6224f5cd8341933c2696581178262a37887c532e09e98e5d075217fcd66574e00cc644fc16ec583b7e2fe54be95c98c477fb20fbe7ad9ed1a9'
            '9c77117f0c2f22c4b413497d475b956f94e0827b08eb99a2b769568e704f4ad65c0229775ffc68990ec7d18758b2a7e5023c91e9bc537e9d2b2eefbe0759b512'
            'a910809a823ba58ca7bdaa72e8d68427b48f452c1fbb2343fa182ecb0a091a7640e73af24b8ba2fdd90e00aed8ef53b7fccd25cb8f04ca9b9fa6c8e52223ca66')

prepare() {
  mkdir -p "$_pkgbasename-v$pkgver/externaldeps/mosquitto"
  cp "lib/mosquitto.h" "$_pkgbasename-v$pkgver/externaldeps/mosquitto/mosquitto.h"
  cp "lib/libmosquitto.a" "$_pkgbasename-v$pkgver/externaldeps/mosquitto/libmosquitto.a"
}

build() {
  cd "$_pkgbasename-v$pkgver"

  autoreconf -i
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
  cd "$_pkgbasename-v$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 system/netdata.conf "$pkgdir"/etc/netdata/netdata.conf
  chown -R 0:134 "$pkgdir"/usr/share/netdata/web

  install -Dm0644 "system/netdata.service.v235" "$pkgdir/usr/lib/systemd/system/netdata.service"
  install -Dm0644 "system/netdata.logrotate" "$pkgdir/etc/logrotate.d/netdata"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgbasename}.conf"
}
