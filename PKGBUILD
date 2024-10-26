# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=solarmeter
pkgver=0.1.5
pkgrel=1
epoch=
pkgdesc="Read energy from ABB Aurora inverter"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ahpohl/solarmeter"
license=('MIT')
groups=()
depends=('mosquitto' 'libabbaurora')
makedepends=()
checkdepends=()
optdepends=('nodejs-node-red' 'postgresql' 'timescaledb' 'pg_cron' 'grafana-bin')
provides=()
conflicts=()
replaces=()
backup=("etc/solarmeter/solarmeter.conf"
        "etc/solarmeter/docker-compose.yaml")
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/solarmeter.git#tag=v${pkgver}"
        "sysusers_solarmeter.conf"
        "solarmeter.service")
noextract=()
sha256sums=('SKIP'
            '8c96a8c940a94b8b86312873ad93a2f2a01a2e1e9dbc52b074b04375189dc26b'
            'fdc5e20bdac099839ffe6353c8f023d7afc1be4843a281daf5f8c3a9dafb166d')
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
  install -Dm644 "$srcdir"/sysusers_$pkgname.conf "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -d "$pkgdir"/etc/$pkgname
  install -Dm644 resources/config/${pkgname}_example.conf "$pkgdir"/etc/$pkgname/$pkgname.conf
  install -Dm644 Dockerfile "$pkgdir"/etc/$pkgname/Dockerfile
  install -Dm644 docker-compose.yaml "$pkgdir"/etc/$pkgname/docker-compose.yaml
  install -d "$pkgdir"/usr/share/$pkgname
  cp -r resources/* "$pkgdir"/usr/share/$pkgname/
}
