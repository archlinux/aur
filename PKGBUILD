pkgname=prometheus-adguard-exporter
pkgver=1.14
pkgrel=1

pkgdesc='Prometheus Exporter for AdguardHome metrics'
url='https://github.com/prometheus/node_exporter'
arch=('x86_64')
license=('MIT')

depends=('glibc')
makedepends=('go' 'git')
options=(!lto)

backup=('etc/conf.d/prometheus-adguard-exporter')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ebrianne/adguard-exporter/archive/refs/tags/v$pkgver.tar.gz"
        prometheus-adguard-exporter.conf
        prometheus-adguard-exporter.service
        prometheus-adguard-exporter.sysusers)

sha256sums=('df4e9febef2bfae2d823083cb8ca4f3a799a9312603896c17825b8af85f758ef'
            'd57a6bfe3b6fcf470053ed344f33aaa8461ab92512fbc27c271cbc254006d8d1'
            '276df659240d72bb2b67f9c018756d4c62fb2f509a3e1da99fdb1c849e1cf1ec'
            '0b944ff91f6309fb751c3bf0ce1fb39549b6f42773a5c115e72d265cf0d5ee5b')

build() {
  cd adguard-exporter-$pkgver

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
      -X github.com/prometheus/common/version.Version=$pkgver \
      -X github.com/prometheus/common/version.Revision=$pkgver \
      -X github.com/prometheus/common/version.Branch=tarball \
      -X github.com/prometheus/common/version.BuildUser=someone@builder \
      -X github.com/prometheus/common/version.BuildDate=$(date -d=@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    .
}

package () {
  install -Dm644 prometheus-adguard-exporter.conf "$pkgdir"/etc/conf.d/prometheus-adguard-exporter
  install -Dm644 prometheus-adguard-exporter.service "$pkgdir"/usr/lib/systemd/system/prometheus-adguard-exporter.service
  install -Dm644 prometheus-adguard-exporter.sysusers "$pkgdir"/usr/lib/sysusers.d/prometheus-adguard-exporter.conf

  cd adguard-exporter-$pkgver

  install -Dm755 adguard-exporter "$pkgdir"/usr/bin/prometheus-adguard-exporter
}