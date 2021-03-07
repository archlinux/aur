# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: KawaiDesu <zmey1992@ya.ru>

pkgname=victoriametrics
_capname=VictoriaMetrics
pkgver=1.55.1
pkgrel=1
pkgdesc="Fast, cost-effective and scalable time series database"
arch=('x86_64')
url="https://victoriametrics.github.io"
license=('Apache')
makedepends=('go')
backup=('etc/default/victoriametrics')
source=("https://github.com/VictoriaMetrics/VictoriaMetrics/archive/v$pkgver.tar.gz"
        "victoriametrics.service"
        "victoriametrics.default")
sha256sums=('083f38a4f03a5096dfef59c4d56fd50d0435054e0b9e175239d99062394e4fe0'
            '8b264a0843ef9ed06b144220b5607027014c7af459293eadd0a3ffcbc05251d2'
            '0fc91310e2c3140bd90b2fad62f497d8e7432cf3a2a8ab3a034b45958e01012a')

build() {
  cd "$_capname-$pkgver"

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
  cd "$_capname-$pkgver"

  go test ./app/victoria-metrics
}

package() {
  install -Dm 755 "${srcdir}/${_capname}-${pkgver}"/bin/victoria-metrics -t "${pkgdir}"/usr/bin/
  install -Dm 644 victoriametrics.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 victoriametrics.default -t "${pkgdir}"/etc/default/victoriametrics
}
