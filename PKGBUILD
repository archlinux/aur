# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="mpp-solar"
_module="$_name"

pkgname=("python-$_module")
pkgdesc="Python package with reference library to get information from solar inverters"
pkgver="0.9.01"
pkgrel=3
url="https://github.com/jblance/mpp-solar"
license=('MIT')
arch=('any')
depends=("python"
         "python-pyserial"
         "python-paho-mqtt"
         "python-pyyaml"
         "python-pymongo"
         "python-psycopg2")
source=("https://github.com/jblance/mpp-solar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f4efaf43817d5403f344dca115daf4012ee9018180ba1305cf5f511ff8829dee')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}


package() {
  cd mpp-solar-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -d "${pkgdir}/usr/share/doc/${pkgname}/service"
  install -d "${pkgdir}"/usr/lib/systemd/system
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -m 644 docs/{MQTT_Influx_Grafana,README,configfile,hardware,interface,service-README,troubleshooting,usage}.md "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m 644 docs/service/{jkbms.conf,mpp-solar.conf}.example "${pkgdir}/usr/share/doc/${pkgname}/service/"
  install -Dm 644 docs/service/{mpp-solar,jkbms}.service "${pkgdir}"/usr/lib/systemd/system/
}

# vim: ts=2 sw=2 et
