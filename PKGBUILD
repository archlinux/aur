# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=gtree
pkgver=1.9.12
pkgrel=1
pkgdesc="Generates tree from Markdown or programmatically"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ddddddO/${pkgname}"
license=('custom:BSD-2-clause')
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4e603e6eaa89fad5f952c9a6425b61ad4a23b05d86dbee9817e2c5571dcaeb44ffe249d77c3e236ee6606fb5e65395c9aff371fb0cc858a5bfabaaf74afd61f3')

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
