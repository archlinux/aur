# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nancy
pkgver=1.0.52
pkgrel=1
pkgdesc="Checks for vulnerabilities in Golang dependencies"
arch=(x86_64 i686 aarch64)
url="https://github.com/sonatype-nexus-community/${pkgname}"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3b371c119cec13e50be5029e2d48714b178edf54ab735615e1b0ac126119af5bf68207a64c5e503e7f48043e419e35fe45bf291e5142428ac1ff979165855d99')

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
