# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=gtree
pkgver=1.8.7
pkgrel=1
pkgdesc="Generates tree from Markdown or programmatically"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ddddddO/${pkgname}"
license=('custom:BSD-2-clause')
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6170f681ab8ca762331d6c925c04b288f84984c099427f30f19f09e96094d1797ed4dc0704c9003ce50020ef8905089f807a0b7fb59e408b902a44cb62a33b2a')

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
