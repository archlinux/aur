# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: KawaiDesu <zmey1992@ya.ru>

pkgname=victoriametrics
_name=VictoriaMetrics
pkgver=1.96.0
pkgrel=1
pkgdesc="Fast, cost-effective and scalable time series database"
arch=(x86_64)
url="https://victoriametrics.github.io"
license=(Apache)
depends=(glibc)
makedepends=(go)
backup=('etc/default/victoriametrics')
source=("https://github.com/VictoriaMetrics/VictoriaMetrics/archive/refs/tags/v$pkgver.tar.gz"
        "victoriametrics.service"
        "victoriametrics.default")
b2sums=('f241ad0da8303da4ca085ae8f447d28e23dd19f30853b96ad24551232e8030d223a27d79aa5ab56df372e10c54b82bd964e7bf69997734379a438adacff06b40'
        'dfe05a39758258ad3298332dc18f35544cbf40c3257208823321f9631581ab9bfc7465018eb02a9990d3df852887e4715478abe7816354effd781a9c13026168'
        '4405dc19795d2cbfa515e4750a2cad77c13611293176ff5aeec597f9905494902bd4496c1e90f1efe2d484e383adb39d034167673b9fe7de8b307b8cedf17b7f')

build() {
  cd "$_name-$pkgver"
  CGO_ENABLED=1 GOOS=linux GOARCH=amd64 GO111MODULE=on CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}" \
    go build -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      -o bin/victoria-metrics \
      ./app/victoria-metrics
}

check() {
  cd "$_name-$pkgver"
  go test ./app/victoria-metrics
}

package() {
  install -Dm 755 "${srcdir}/${_name}-${pkgver}"/bin/victoria-metrics -t "${pkgdir}"/usr/bin/
  install -Dm 644 victoriametrics.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 victoriametrics.default "${pkgdir}"/etc/default/victoriametrics
}

# vim:set ts=2 sw=2 et:
