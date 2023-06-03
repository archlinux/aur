# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=gtree
pkgver=1.7.43
pkgrel=1
pkgdesc="Generates tree from Markdown or programmatically"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ddddddO/${pkgname}"
license=('custom:BSD-2-clause')
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fa88672cfce72562c33e1f9892b0b443925760561d247cde5b6a290e42b5b6279e74316a84d89f6328e8a6e2dda5cbe7a6655a1421e184f270e3e9966de55df4')

prepare() {
  cd ${pkgname}-${pkgver}
  mkdir -p build
  go mod download
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd ${pkgname}-${pkgver}
  go build \
    -o build \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    ./cmd/gtree
}

check() {
  cd ${pkgname}-${pkgver}
  go test .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dv build/gtree -t "$pkgdir/usr/bin/"
  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
}
