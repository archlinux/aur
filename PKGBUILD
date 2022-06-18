# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-ipmi-exporter
pkgver=1.6.1
pkgrel=1
pkgdesc='Prometheus exporter for IPMI metrics'
arch=(x86_64)
url='https://github.com/prometheus-community/ipmi_exporter'
license=('MIT')
depends=('glibc' 'freeipmi')
makedepends=('git' 'go')
options=('!lto')
_commit='344b8b4a565a9ced936aad4d4ac9a29892515cba'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'systemd.service'
  'sysusers.conf'
)
sha512sums=('SKIP'
            'fb373d8884167f1eea3efff0a1dd5518bf9033e9653c76fc551c2295348a5681871e545672771ffbd571190869097696f74cc6ce5439820aec1b1785f1c65cc3'
            '6a054c496a7cbfe1946713001d8fe460360bd42a473aa7cc0aed0fbfd4d989e67a62d4b4be7e9d828b4572dc06d6afedf16797ce58279b2d4b1c9343b5088feb')
b2sums=('SKIP'
        'adae5f80306c13ef619c47a732eab9067c9f11ec025e7e46abb200f1c122d4cccd1c55cec99120e373022e1f798f4623bb93c9e8ff6801e6915a9d385a4ed8bd'
        '93e62d3bacccb26e808271fa4f576dc5e67cb5111f7d0c744a4f029aa3974de29742b4301f4058db38884de1cb049969c533291daf0fa6a9f3175a77c72b0001')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/prometheus/common/version.Version=$pkgver \
    -X github.com/prometheus/common/version.Revision=$pkgver \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=someone@builder \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o build \
    .
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/ipmi_exporter

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ipmi*.yml docs/*.md README.md
}
