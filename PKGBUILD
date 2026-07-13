# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=richmond-council-rss
pkgver=0.0.5
pkgrel=1
pkgdesc="Scrapes the Richmond upon Thames council news pages and serves them as an RSS feed"
arch=('x86_64')
url="https://github.com/dcelasun/richmond-council-rss"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dcelasun/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fbb32d3f700e03d778d0eb480170ba90ad99e51cba7397378018f90380f6eead')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # set GOPATH so makepkg puts source files into the debug package
  export GOPATH="$srcdir"

  cd "${pkgname}-${pkgver}"
  go build -o build/ .
}

package() {
  cd "${pkgname}-${pkgver}"

  # binary
  install -vDm755 "build/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

  # systemd unit
  install -vDm644 "${pkgname}.service" \
    "$pkgdir/usr/lib/systemd/system/${pkgname}.service"

  # license & documentation
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
  install -vDm644 README.md -t "$pkgdir/usr/share/doc/${pkgname}"
}
