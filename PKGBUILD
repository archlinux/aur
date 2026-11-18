# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=knbud
pkgver=1.0.4
pkgrel=1
pkgdesc="Scales Kubernetes workloads safely for NFS maintenance"
arch=('x86_64' 'aarch64')
url="https://github.com/dcelasun/knbud"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('873d053e0fd32621dcd9bd7deafe3162601352e8309e4b273cb13229a22e0bfe')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"

  cd "${pkgname}-${pkgver}"
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o knbud \
    ./cmd/knbud
}

check() {
  export GOPATH="${srcdir}"

  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -vDm755 knbud -t "${pkgdir}/usr/bin"
  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
