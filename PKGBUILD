# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=froniusd
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="Read data from a Fronius inverter"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ahpohl/froniusd"
license=('MIT')
groups=()
depends=('mosquitto' 'libsunspec>=0.1.3' 'libmodbus>=3.1.11')
makedepends=()
checkdepends=()
optdepends=('nodejs-node-red' 'postgresql' 'timescaledb' 'pg_cron' 'grafana-bin')
provides=()
conflicts=()
replaces=()
backup=("etc/froniusd/froniusd.conf"
        "etc/froniusd/docker-compose.yaml")
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/froniusd.git#tag=v${pkgver}"
        "sysusers_froniusd.conf"
        "froniusd.service")
noextract=()
sha256sums=('e06bde59e13232849d80ccbff11ac6d41208ae7b0354b32fde9bea7e3719d1fa'
            '8c96a8c940a94b8b86312873ad93a2f2a01a2e1e9dbc52b074b04375189dc26b'
            'c7e4c04a984a3ea49991c4bf5cf4dac26fa9b2e9eda1a801d20c57e5941d2bfd')
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
  install -d "$pkgdir"/etc/$pkgname
  install -Dm644 resources/config/froniusd_example.conf "$pkgdir"/etc/$pkgname/froniusd.conf
  install -Dm644 Dockerfile "$pkgdir"/etc/$pkgname/Dockerfile
  install -Dm644 docker-compose.yaml "$pkgdir"/etc/$pkgname/docker-compose.yaml
  install -d "$pkgdir"/usr/share/$pkgname
  cp -r resources/* "$pkgdir"/usr/share/$pkgname/
}
