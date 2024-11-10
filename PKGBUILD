# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=gasmeter
pkgver=0.5.5
pkgrel=3
epoch=
pkgdesc="Analog gasmeter readout with an IR dongle"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ahpohl/gasmeter"
license=('MIT')
groups=()
depends=('mosquitto')
makedepends=('git' 'avr-gcc' 'avr-libc')
checkdepends=()
optdepends=('nodejs-node-red' 'postgresql' 'timescaledb' 'pg_cron' 'grafana-bin' 'avrdude' 'gnuplot')
provides=()
conflicts=()
replaces=()
backup=("etc/gasmeter/gasmeter.conf"
        "etc/gasmeter/docker-compose.yaml")
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/gasmeter.git#tag=v${pkgver}"
        "sysusers_gasmeter.conf"
        "gasmeter.service")
noextract=()
sha256sums=('565d61260c2eca8d0028b0bba91a38dfd040d2fbea7fbdd72abf8775536141d4'
            '48f1ce02fdc6b8aa46ac4bcd3d782642e69f0b717a0b8121748329ae02ff831e'
            '26f98848587822c4a707742b7706d71ac123ce1535baf1a80502472f5bdcf191')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
  make firmware
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG.md
  install -Dm644 "$srcdir"/sysusers_$pkgname.conf "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -d "$pkgdir"/etc/$pkgname
  install -Dm644 resources/config/${pkgname}_example.conf "$pkgdir"/etc/$pkgname/$pkgname.conf
  install -Dm644 Dockerfile "$pkgdir"/etc/$pkgname/Dockerfile
  install -Dm644 docker-compose.yaml "$pkgdir"/etc/$pkgname/docker-compose.yaml
  install -d "$pkgdir"/usr/share/$pkgname
  rm resources/firmware/build/*.o resources/firmware/build/*.elf
  cp -r resources/* "$pkgdir"/usr/share/$pkgname
}
