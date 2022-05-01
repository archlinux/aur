# Maintainer: RubenKelevra
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=netdata-cloud
_pkgbasename=netdata
pkgver=1.34.1
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
optdepends=('lm_sensors: for monitoring hardware sensors'
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
b2sums=('d166b121e567c9cd0e7929326a5c5049af953f396e7bc38f86b06a83bca9bb823fb4842585d87e237596fec9fe091e50fade2a3cf17e6426de33cbfecc2c92dd'
        '2d9344181798e22561a2ea363467e16bed3336acd6bb5a7241623f3a40cbdc6d697f94419a4ef3907120fe5dffd5462151ed66fed256998de1f27e4bede47e59'
        'af8a5fbdd3d76fbe378113ca9202a2ce0abefa4f0ad72e470bd9e4d3775d859ec9359fc1113eae80190da9d29ce1ac4476c5745c411dbaf7a0c5f12e086b9378')
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
