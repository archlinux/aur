# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=prometheus-zfs-exporter
pkgver=2.3.4
pkgrel=1
pkgdesc="Prometheus exporter for ZFS (pools, filesystems, snapshots and volumes)"
url="https://github.com/pdf/zfs_exporter"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('go')
backup=('etc/conf.d/prometheus-zfs-exporter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pdf/zfs_exporter/archive/refs/tags/v$pkgver.tar.gz"
        prometheus-zfs-exporter.service
        prometheus-zfs-exporter.conf)
sha256sums=('e6266fdeff6fa95a1a5ccdf814379542d6fc6ff0f1b76d3cddd07b76102fd4b0'
            'b760884dd87bf47d0f3bd733d1ba2aabe8f6049242ed92503533ddb8023cbf01'
            'f83f5bb2c0fd93126ea76c29364fd23b80fe2acac286f74f9f92d7d6449b1e85')
b2sums=('305c7b4c76b323bdfe70cd97b3051b2de80467ed01e4ff81cc15bee0360adca10f28598c283fd5406b77e762a8fdeeb2b33112f13dcc56dc84fcc35f0836d809'
        '2da7e1f78b77c5cc73fafc38c28d3524fec6f313ed002e3342da2ec9bb5ce8387190f52f6e8e2937bafb09bc9925bdd4e2064e1db0c1e545df90c3b65b13aee6'
        '9911aa90947ecbbecd036fd093e7c9bc649bd0bd7a0005c0c9eb33409adfc0476f4b95e562814943422ae6be49fd0031f54ad6ea3f6dde9541ba41d9f3effbfa')

build() {
  cd "zfs_exporter-$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false"

  go build -v -o prometheus-zfs-exporter .
}

package() {
  cd "zfs_exporter-$pkgver"

  install -Dm0755 prometheus-zfs-exporter "$pkgdir/usr/bin/prometheus-zfs-exporter"

  install -Dm0644 "$srcdir/prometheus-zfs-exporter.service" \
    "$pkgdir/usr/lib/systemd/system/prometheus-zfs-exporter.service"
  install -Dm0644 "$srcdir/prometheus-zfs-exporter.conf" \
    "$pkgdir/etc/conf.d/prometheus-zfs-exporter"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
