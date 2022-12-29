# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=gasmeter
pkgver=0.5.2
pkgrel=1
epoch=
pkgdesc="Analog gasmeter readout with an IR dongle"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ahpohl/gasmeter"
license=('MIT')
groups=()
depends=('mosquitto')
makedepends=('avr-gcc' 'avr-libc')
checkdepends=()
optdepends=('nodejs-node-red' 'postgresql' 'timescaledb' 'pg_cron' 'grafana-bin' 'avrdude')
provides=()
conflicts=()
replaces=()
backup=('etc/gasmeter.conf')
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/gasmeter.git#tag=v${pkgver}"
        "sysusers_gasmeter.conf"
        "gasmeter.service")
noextract=()
sha256sums=('SKIP'
            '48f1ce02fdc6b8aa46ac4bcd3d782642e69f0b717a0b8121748329ae02ff831e'
            '5b7727c619e7a9ece367c30adedb85793e4f133c451035f898a29d7ea0996569')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
  make
  cd resources/firmware
  make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG.md
  install -Dm644 "$srcdir"/sysusers_gasmeter.conf "$pkgdir"/usr/lib/sysusers.d/gasmeter.conf
  install -Dm644 "$srcdir"/gasmeter.service "$pkgdir"/usr/lib/systemd/system/gasmeter.service
  install -Dm644 resources/config/gasmeter_example.conf "$pkgdir"/etc/gasmeter.conf
  install -Dm644 resources/config/gasmeter_example.conf "$pkgdir"/usr/share/gasmeter/config/gasmeter_example.conf
  
  install -d "$pkgdir"/usr/share/gasmeter/postgres
  install -Dm644 resources/postgres/*.sql "$pkgdir"/usr/share/gasmeter/postgres
  install -Dm644 resources/nodejs/node-red-flow.json "$pkgdir"/usr/share/gasmeter/nodejs/node-red-flow.json
  install -Dm644 resources/grafana/grafana-dashboard.json "$pkgdir"/usr/share/gasmeter/grafana/grafana-dashboard.json
  install -d "$pkgdir"/usr/share/gasmeter/firmware
  install -Dm644 resources/firmware/bootloader/optiboot_atmega328.hex "$pkgdir"/usr/share/gasmeter/firmware/optiboot_atmega328.hex
  install -Dm644 resources/firmware/build/gasmeter.hex "$pkgdir"/usr/share/gasmeter/firmware/gasmeter.hex
}
