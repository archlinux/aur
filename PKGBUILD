# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=froniusd
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Read data from a Fronius inverter"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ahpohl/froniusd"
license=('MIT')
groups=()
depends=('mosquitto' 'libsunspec' 'libmodbus')
makedepends=()
checkdepends=()
optdepends=('nodejs-node-red' 'postgresql' 'timescaledb' 'pg_cron' 'grafana-bin')
provides=()
conflicts=()
replaces=()
backup=('etc/froniusd.conf')
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/froniusd.git#tag=v${pkgver}"
        "sysusers_froniusd.conf"
        "froniusd.service")
noextract=()
sha256sums=('SKIP'
            '8c96a8c940a94b8b86312873ad93a2f2a01a2e1e9dbc52b074b04375189dc26b'
            '42e303760645ac8a393bda720304373abf3ce652f4c755d4a37f58a77447ba2f')
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
  install -Dm644 "$srcdir"/sysusers_froniusd.conf "$pkgdir"/usr/lib/sysusers.d/froniusd.conf
  install -Dm644 "$srcdir"/froniusd.service "$pkgdir"/usr/lib/systemd/system/froniusd.service
  install -Dm644 resources/config/froniusd_example.conf "$pkgdir"/etc/froniusd.conf
  install -d "$pkgdir"/usr/share/$pkgname
  cp -r resources/* "$pkgdir"/usr/share/$pkgname/
}
