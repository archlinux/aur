# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=gasmeter
pkgver=0.4.3
pkgrel=1
epoch=
pkgdesc="Analog gasmeter readout with an IR dongle"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ahpohl/gasmeter"
license=('MIT')
groups=()
depends=('mosquitto')
makedepends=()
checkdepends=()
optdepends=('nodejs-node-red' 'postgresql' 'timescaledb' 'pg_cron' 'grafana-bin')
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
            '8c96a8c940a94b8b86312873ad93a2f2a01a2e1e9dbc52b074b04375189dc26b'
            '2135d760f07b40935a77b010446209cffc14cf3883f292cbed1e98c0094c1bbb')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
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
}
