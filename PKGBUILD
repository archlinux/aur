pkgname=unpoller
pkgver=2.7.11
pkgrel=1

pkgdesc="Collect your UniFi controller data and report it to an InfluxDB instance, or export it for Prometheus collection."
url="https://unpoller.com/"
arch=('x86_64')
license=('MIT')

depends=('glibc')
makedepends=('go' 'git')

backup=('etc/conf.d/unpoller.conf')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/unpoller/unpoller/archive/v${pkgver}.tar.gz"
	unpoller.conf
        unpoller.service
        unpoller.sysusers)
sha256sums=('fe4654612b737938132d2a91978b5a004c4727e3a34e15dc1ca95f24ca6cd10e'
            '6bf48404916555cf46f75aff54c8ac2eef9ef91c835949a21f64cea98fb9e05b'
            'decf90f6d5a907bae685d38291ef0aeefd8af406e54f3292e29245347d8179b8'
            '24bf33b9a4e9693984104e755109361dae5d7cb399220c5bcfd35a2bd2d0c9b6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  go build .
}

package() {
  install -Dm644 unpoller.conf "${pkgdir}/etc/conf.d/unpoller.conf"
  install -Dm644 unpoller.service "${pkgdir}/usr/lib/systemd/system/unpoller.service"
  install -Dm644 unpoller.sysusers "${pkgdir}/usr/lib/sysusers.d/unpoller.conf"

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 unpoller "$pkgdir/usr/bin/unpoller"
}
