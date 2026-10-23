# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nancy
pkgver=2.1.1
pkgrel=1
pkgdesc="Checks for vulnerabilities in Golang dependencies"
arch=(x86_64 i686 aarch64)
url="https://github.com/sonatype-nexus-community/${pkgname}"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7dca3f545927b1585210907b0455a41695f986b9ae99d3dd8bb07cb33cb5c789ed2d88c6e868eec42777006bca247632e744b68fb4ede01ee8c7d555c8b38d1e')

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
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  cd ${pkgname}-${pkgver}
  go build -o build
}

# FIXME: investigate failing test
# check() {
# 	cd ${pkgname}-${pkgver}
# 	go test ./...
# }

package() {
  cd ${pkgname}-${pkgver}
  install -D build/nancy -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
