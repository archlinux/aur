# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=gtree
pkgver=1.9.9
pkgrel=1
pkgdesc="Generates tree from Markdown or programmatically"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ddddddO/${pkgname}"
license=('custom:BSD-2-clause')
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('496ced7ae8cc0f4557faf02c5761ebd6b723cba98ff2fef5b0a54ebd5789a9b6070da6892939905f34dcf6a3a06e3455b55e6b96d02f230774b914c51dbfe99a')

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
