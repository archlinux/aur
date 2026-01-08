# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=cloudquery-cli
pkgver=6.33.1
pkgrel=1
pkgdesc=" The open source high performance ELT framework powered by Apache Arrow"
arch=('x86_64' 'aarch64')
url="https://github.com/cloudquery/cloudquery"
options=(!lto)
license=('MPL-2.0')
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cloudquery/cloudquery/archive/refs/tags/cli-v${pkgver}.zip")
sha256sums=('6f998ed473f3fec523d33ead311a24e9e8a9f9f9a7779dae4025a96fbb096083')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${pkgname}-v${pkgver}/cli"
  make gen
  go build
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -Dm 755 "${srcdir}/${pkgname}-v${pkgver}/cli/cli" "${pkgdir}/usr/bin/cloudquery"
}

