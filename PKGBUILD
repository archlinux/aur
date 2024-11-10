# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=smartmeter
pkgver=0.3.9
pkgrel=1
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
backup=("etc/smartmeter/smartmeter.conf"
        "etc/smartmeter/docker-compose.yaml")
options=(!strip)
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/smartmeter.git#tag=v${pkgver}"
        "sysusers_smartmeter.conf"
        "smartmeter.service")
noextract=()
sha256sums=('81ab42e136f45da8983a347fcc3efa2232b2906976c3b27151de06ad6fb292ec'
            'c5de1caa62617c8a3287a342ec868e00c8a808647f71bef3a606521d76ac318f'
            '625c1f130758a596f3115cf0ae9f7317d323fcd0a7245f950e07cfb2fc574cb4')
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
