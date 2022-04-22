# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=prometheus-zfs-exporter
pkgver=2.2.5
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
sha256sums=('7b176ae6c3d2e1dbff528adb0c9c1db9c9937e3b5ac44e12682a5a99c791b8ec'
            'b760884dd87bf47d0f3bd733d1ba2aabe8f6049242ed92503533ddb8023cbf01'
            'f83f5bb2c0fd93126ea76c29364fd23b80fe2acac286f74f9f92d7d6449b1e85')
b2sums=('ed8670fc491e74c8e31f4d4143bae98d4c8d77a170c22b2c2d79757516dd4a88484c20c3eb95238593fd58ee7ea2146593b97c8808f4ca204cbb4e698a18c25b'
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
