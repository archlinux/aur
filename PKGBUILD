# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=influxdb-bin
pkgver=0.9.4.2
pkgrel=1
pkgdesc='Scalable datastore for metrics, events, and real-time analytics'
arch=('x86_64')
url='https://influxdb.com/'
license=('GPL')
depends=('glibc')
install=$pkgname.install
source=(https://s3.amazonaws.com/influxdb/influxdb_${pkgver}_x86_64.tar.gz
        influxdb.service.d)
md5sums=('6abb3d5df9b69aeb9bae37d0889bf67a'
         '62f0771efc4007cc9577e9f198e21535')

prepare() {
  cd influxdb_${pkgver}_x86_64

  sed -i 's|/var/opt/influxdb|/var/lib/influxdb|g' \
    etc/opt/influxdb/influxdb.conf
}

package() {
  cd influxdb_${pkgver}_x86_64

  install -Dm755 opt/influxdb/versions/$pkgver/influxd "$pkgdir"/usr/bin/influxd
  install -Dm755 opt/influxdb/versions/$pkgver/influx "$pkgdir"/usr/bin/influx

  install -Dm644 etc/opt/influxdb/influxdb.conf \
    "$pkgdir"/etc/influxdb/influxdb.conf
  install -Dm644 etc/logrotate.d/influxd "$pkgdir"/etc/logrotate.d/influxd

  install -Dm644 opt/influxdb/versions/$pkgver/scripts/influxdb.service \
    "$pkgdir"/usr/lib/systemd/system/influxdb.service
  install -Dm644 "$srcdir"/influxdb.service.d \
    "$pkgdir"/usr/lib/systemd/system/influxdb.service.d/arch.conf
}
