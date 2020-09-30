# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-ipmi-exporter
_pkgname=ipmi_exporter
pkgver=1.3.0
pkgrel=1
pkgdesc="Prometheus exporter for IPMI metrics"
arch=(x86_64)
url="https://github.com/soundcloud/ipmi_exporter"
license=(MIT)
makedepends=(go)
depends=(freeipmi)
backup=("etc/conf.d/prometheus-ipmi-exporter")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.conf"
        "$pkgname.service"
        "$pkgname.sysusers")
b2sums=('18f0762e8756edb0088a16e97fdbd78e7b27e150d1f9c76dbfef5a76d8c78e96548eef645975759b33f8c5f07b05804b251a3ca366c8c1cebf0a0351ba5adebb'
        '39663e6da79867687a85662a49c3d70f97ca1f528562b67928265f512718d975feb9b3a2ab5f169f72f947eb334b02bbcd307c4f0641e6a18d05e9d2824b934e'
        '093e8a00fedfa18fe13bb43638edcb99fe0ca546b7ba2a7c6bb887083c14eaf7ba5041011af4554859a916de7a2f78e8ae575df57d8f3e59fb88a7a91e3a3021'
        '93e62d3bacccb26e808271fa4f576dc5e67cb5111f7d0c744a4f029aa3974de29742b4301f4058db38884de1cb049969c533291daf0fa6a9f3175a77c72b0001')

build() {
  cd "$_pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/prometheus/common/version.Version=$pkgver \
    -X github.com/prometheus/common/version.Revision=$pkgver \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=someone@builder \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    .
}

package() {
  # systemd files
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$pkgname.conf" "$pkgdir/etc/conf.d/$pkgname"

  cd "$_pkgname-$pkgver"

  # binary
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # docs
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ipmi_local.yml \
    ipmi_remote.yml \
    README.md
}
