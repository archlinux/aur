# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=smartmeter
pkgver=0.3.1
pkgrel=3
epoch=
pkgdesc="Read energy utility meter with IR dongle"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ahpohl/smartmeter"
license=('MIT')
groups=()
depends=('mosquitto')
makedepends=()
checkdepends=()
optdepends=('nodejs-node-red' 'postgresql' 'timescaledb' 'pg_cron' 'grafana-bin')
provides=()
conflicts=()
replaces=()
backup=('etc/smartmeter.conf')
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/smartmeter.git#tag=v${pkgver}"
        "sysusers_smartmeter.conf"
        "smartmeter.service")
noextract=()
sha256sums=('SKIP'
            'f92ad1fedc468528aca23d82111cde995bf53589e9e7a8cee41908c7256a64d0'
            'e52f1f8b35dd9ed372f836a08c68fc9194d0cd59252a7d2e76cd939f36f379c0')
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
  install -Dm644 resources/config/smartmeter_example.conf "$pkgdir"/etc/smartmeter.conf
  install -Dm644 "$srcdir"/sysusers_smartmeter.conf "$pkgdir"/usr/lib/sysusers.d/smartmeter.conf
  install -Dm644 "$srcdir"/smartmeter.service "$pkgdir"/usr/lib/systemd/system/smartmeter.service
  install -d "$pkgdir"/usr/share/smartmeter/postgres
  install -d "$pkgdir"/usr/share/smartmeter/config
  install -Dm644 resources/postgres/*.sql "$pkgdir"/usr/share/smartmeter/postgres
  install -Dm644 resources/config/smartmeter_example.conf "$pkgdir"/usr/share/smartmeter/config
}
