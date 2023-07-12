# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ícar N. S. <icar.nin@protonmail.com>

pkgname=crawley
pkgver=1.6.7
pkgrel=1
pkgdesc="Simple web scraper"
arch=('x86_64' 'aarch64')
url="https://github.com/s0rg/${pkgname}"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5f84cfc052b87914da44d87efe270e962e024d4086f0c4bb58acec9742726b7b2fdaf746a97f230817df17f093d50d7d1613064b9d6a1c4c9bb44b85318b2c36')

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
  go vet ./...
  go build -o build -ldflags="-linkmode=external -X main.gitVersion=${pkgver}" ./cmd/crawley
}

check() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  cd ${pkgname}-${pkgver}
  go test ./...
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dv "build/${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
