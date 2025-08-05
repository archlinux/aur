# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=cloudquery-cli
pkgver=6.26.3
pkgrel=1
pkgdesc=" The open source high performance ELT framework powered by Apache Arrow"
arch=('x86_64' 'aarch64')
url="https://github.com/cloudquery/cloudquery"
options=(!lto)
license=('MPL-2.0')
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cloudquery/cloudquery/archive/refs/tags/cli-v${pkgver}.zip")
sha256sums=('869720979ba0518578fe2d5fec9d672b4bb774fe5f61d3c7422efebd55952cd3')

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

