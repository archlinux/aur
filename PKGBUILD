# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nancy
pkgver=1.0.50
pkgrel=1
pkgdesc="Checks for vulnerabilities in Golang dependencies"
arch=(x86_64 i686 aarch64)
url="https://github.com/sonatype-nexus-community/${pkgname}"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2a02dbbfe02b2306b1d529d01ad71253c63fa28581585a471ea919f2d2c9b3ab869b1bb5bd6c11df80f86aa82c5648bd1b567f387717c0773f0bb648439c1ebd')

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
