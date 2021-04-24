# Maintainer: RubenKelevra
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=netdata-cloud
_pkgbasename=netdata
pkgver=1.30.1
pkgrel=1
_libmosquitto_version="v.1.6.8_Netdata-5"
pkgdesc="Real-time performance monitoring, in the greatest possible detail, over the web. Cloud enabled edition"
url="https://github.com/netdata/netdata"
arch=('any')
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
	"https://github.com/netdata/mosquitto/archive/refs/tags/${_libmosquitto_version}.tar.gz"
        "$pkgname.sysusers")
sha512sums=('c3d116bf3459ca6224f5cd8341933c2696581178262a37887c532e09e98e5d075217fcd66574e00cc644fc16ec583b7e2fe54be95c98c477fb20fbe7ad9ed1a9'
	    '5661c7219517ed9a804f1b6fbac6f18f840aa1855d0acae2edf609c869eea826239ce57e604e77a9f1e95b8aca18564066c56ce71f7022a0017211b77a1d6c30'
            'a910809a823ba58ca7bdaa72e8d68427b48f452c1fbb2343fa182ecb0a091a7640e73af24b8ba2fdd90e00aed8ef53b7fccd25cb8f04ca9b9fa6c8e52223ca66')

build() {
 
  pushd "mosquitto-${_libmosquitto_version}"

  make WITH_WEBSOCKETS=yes binary

  popd

  mkdir -p "$_pkgbasename-v$pkgver/externaldeps/mosquitto"
  
  cp "mosquitto-${_libmosquitto_version}/lib/mosquitto.h" "$_pkgbasename-v$pkgver/externaldeps/mosquitto/mosquitto.h"
  cp "mosquitto-${_libmosquitto_version}/lib/libmosquitto.a" "$_pkgbasename-v$pkgver/externaldeps/mosquitto/libmosquitto.a"

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
