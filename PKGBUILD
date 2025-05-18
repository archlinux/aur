# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=gtree
pkgver=1.11.7
pkgrel=1
pkgdesc="Generates tree from Markdown or programmatically"
arch=(x86_64 i686 aarch64)
url="https://github.com/ddddddO/${pkgname}"
license=(BSD-2-clause)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8114651dd88920fe09876ddd5cca04c460bec0ea935c71e0a628221758b3c375d7af045ac333f023ffab33a2fd35a66fcb74dad2c4620c3860a59936f85bc857')

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
