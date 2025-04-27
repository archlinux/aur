# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-apcupsd-exporter
_pkgname=apcupsd_exporter
pkgver=0.3.0
pkgrel=2
pkgdesc="Prometheus exporter for apcupsd metrics"
arch=('x86_64')
url="https://github.com/mdlayher/apcupsd_exporter"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('apcupsd: for monitoring a local APC UPS')
backup=("etc/conf.d/prometheus-apcupsd-exporter")
options=('!lto')
source=(
  "$pkgname::git+$url.git#tag=v$pkgver"
  "$pkgname.conf"
  'systemd.service'
  'sysusers.conf'
)
b2sums=('fd1bd3c7260e4a2939fe9bae76035444529cf022398429d7ea5c4082cf51c5d3c75526ae4ad226252baf1e3e370c902fc32fd6d8bd926d65f880f0580b6b1715'
        '2159bae9adb5a5af4bdec96a593a1988ebb80c3716284fe9c7d765f8ca10992c5db877d395ced0a5bace3e075145ebc2a50f02eb0f11bda7ba145e0fa98c8e43'
        'b5b50dc0b5d707c338268f9b0265deeffa4e1ec87cb12b8520248205e809c569e84dedd69dd4118a0fb97bff6d7c213275dce3bc911ddfc2243769ebf7bdaf0e'
        '1a9e982c7bed03f2f29e45d40374044860aa6e05f877a66ce8900c6a088eddd2f30dc8335be3690edb410ab780ef655d402a528214e0b676da684536f9ae6687')

prepare() {
  cd "$pkgname"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" \
    -X github.com/prometheus/common/version.Version=$pkgver \
    -X github.com/prometheus/common/version.Revision=$(git rev-parse HEAD) \
    -X github.com/prometheus/common/version.Branch=main \
    -X github.com/prometheus/common/version.BuildUser=someone@builder \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o build \
    ./cmd/...
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  # systemd files
  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm640 "$pkgname.conf" "$pkgdir/etc/conf.d/$pkgname"

  cd "$pkgname"

  # binary
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname/LICENSE.md"
}
