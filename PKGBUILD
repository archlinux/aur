# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=prometheus-exporter-proxy
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple reverse proxy for prometheus exporters"
arch=('x86_64' 'aarch64')
url="https://github.com/rrreeeyyy/exporter_proxy"
license=('MIT')
makedepends=('go-pie')
backup=('etc/prometheus-exporter-proxy/config.yml')
source=(
  "prometheus-exporter-proxy.service"
  "config.yml"
  "https://github.com/rrreeeyyy/exporter_proxy/archive/v${pkgver}.tar.gz"
)

prepare() {
  mkdir -p gopath/src/github.com/rrreeeyyy
  ln -rTsf "exporter_proxy-$pkgver" gopath/src/github.com/rrreeeyyy/exporter_proxy
  export GOPATH="$srcdir"/gopath
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/rrreeeyyy/exporter_proxy

  go build \
      -gcflags "all=-trimpath=$GOPATH" \
      -asmflags "all=-trimpath=$GOPATH" \
      -ldflags "-extldflags $LDFLAGS" \
      -o exporter-proxy .
}

package() {
  cd "exporter_proxy-$pkgver"
  install -Dm0755 exporter-proxy "${pkgdir}/usr/bin/prometheus-exporter-proxy"
  install -Dm0644 "${srcdir}/prometheus-exporter-proxy.service" "${pkgdir}/usr/lib/systemd/system/prometheus-exporter-proxy.service"
  install -Dm0644 "${srcdir}/config.yml" "${pkgdir}/etc/prometheus-exporter-proxy/config.yml"
}
sha512sums=('9f8a15df5a7e80179e0fee256462bbc55758732608d3e04d6657b4c8121dba183dee711dbc989fc18e84687120c5345c1587f47ecffbd2dc10186c00d0bdc79c'
            'b844466870c3cc55427ba29717338d1e57dfe6a4edb71ce00b8982408c309b2f60bb66a0275362e5f615e7b7116bd9a138ad940cf18d9cfaed975ff9a12c8648'
            '59772eb7f2635fa2eedda6a9fd5ee07772ced009afe64f854e33f44ae9f280840d2c9f7365b4fb08a526bf30d463a67dd71e2623e311ef5a153898f17c35fae3')
