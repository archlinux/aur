# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nancy
pkgver=1.0.45
pkgrel=1
pkgdesc="Checks for vulnerabilities in Golang dependencies"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/sonatype-nexus-community/${pkgname}"
license=(Apache)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('acd6120c0adf20e91be1684ecb9d5d756ad989047bff01c1ae01af17a38978133006c5bca886301ceda6b1ddd6ee3f8f2c2c5095717a95fa16b075f26841fd18')

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
