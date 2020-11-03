# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-apcupsd-exporter
_pkgname=apcupsd_exporter
pkgver=0.2.0
pkgrel=1
pkgdesc="Prometheus exporter for apcupsd metrics"
arch=(x86_64)
url="https://github.com/mdlayher/apcupsd_exporter"
license=(MIT)
makedepends=(go)
backup=("etc/conf.d/prometheus-apcupsd-exporter")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.conf"
        "$pkgname.service"
        "$pkgname.sysusers")
b2sums=('1088e2ea94566b68ed021216d62d405e802ffd575c6ea26f9ebd6d2910091876d80a19e5ffdd58cb3c3cd0e74710c1831606bdc2040b3390e0a537c72e52c2a8'
        '2159bae9adb5a5af4bdec96a593a1988ebb80c3716284fe9c7d765f8ca10992c5db877d395ced0a5bace3e075145ebc2a50f02eb0f11bda7ba145e0fa98c8e43'
        '11728a44727abb45ca975da8f23e7ecd847d37d6cbf8ef464e8ec26d1abd6b250499e12c9fed87b5b481f3af31e7df6b2d76781bf35dc612a7cf0b683fdc61b4'
        '1a9e982c7bed03f2f29e45d40374044860aa6e05f877a66ce8900c6a088eddd2f30dc8335be3690edb410ab780ef655d402a528214e0b676da684536f9ae6687')

prepare() {
  cd "$_pkgname-$pkgver"
  go mod vendor
}

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
    github.com/mdlayher/apcupsd_exporter/cmd/apcupsd_exporter
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
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$_pkgname-$pkgver/LICENSE.md"
}
