# Maintainer: Angelo Fallaria <ba.fallaria+aur@gmail.com>
pkgname=victoriatraces
pkgver=0.11.0
pkgrel=1
pkgdesc="Fast and easy to use database for traces that can handle terabytes of trace spans."
arch=('x86_64' 'aarch64')
url="https://docs.victoriametrics.com/victoriatraces/"
license=('Apache-2.0')
depends=(glibc)
makedepends=(go)
provides=('victoriatraces')
conflicts=('victoriatraces')
backup=('etc/default/victoriatraces')
install=victoriatraces.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/VictoriaMetrics/VictoriaTraces/archive/refs/tags/v$pkgver.tar.gz"
        "victoriatraces.service"
        "victoriatraces.default")
sha256sums=('f1bba5c80f8253ddf5af0bae86671d19146c4802611c6ca7a72a2bbc6fc66486'
            'b46538d2ac4c3a3c8f8df0c9041b0c5d33f735d33e04141aa88bf1bf0318999e'
            '0fc91310e2c3140bd90b2fad62f497d8e7432cf3a2a8ab3a034b45958e01012a')

build() {
  cd "${srcdir}/VictoriaTraces-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -X github.com/VictoriaMetrics/VictoriaMetrics/lib/buildinfo.Version=$pkgver" \
      -o bin/ \
      ./app/victoria-traces ./app/vtagent
}

package(){
  install -Dm755 "${srcdir}/VictoriaTraces-$pkgver/bin/victoria-traces" "$pkgdir/usr/bin/victoriatraces"
  install -Dm755 "${srcdir}/VictoriaTraces-$pkgver/bin/vtagent" "$pkgdir/usr/bin/vtagent"
  install -Dm644 "${srcdir}/victoriatraces.service" "${pkgdir}/usr/lib/systemd/system/victoriatraces.service"
  install -Dm644 "${srcdir}/victoriatraces.default" "${pkgdir}/etc/default/victoriatraces"
}
