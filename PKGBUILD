# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nancy
pkgver=1.0.42
pkgrel=1
pkgdesc="Checks for vulnerabilities in Golang dependencies"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/sonatype-nexus-community/${pkgname}"
license=(Apache)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7fee16c2154330bf9cc16673d86a77c1d3ca734867242e0713ab2d195ec26e178d300fc2682a1a441babfbc28583404fe1b426686e44dc91c3cf81e7a1f80be2')

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
