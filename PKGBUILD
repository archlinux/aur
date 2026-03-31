# Maintainer: Gallifreyan <gallifreyan@protonmai.ch>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ícar N. S. <icar.nin@protonmail.com>

pkgname=crawley
pkgver=1.7.18
pkgrel=1
pkgdesc="Simple web scraper"
arch=('x86_64')
url="https://github.com/s0rg/${pkgname}"
license=(MIT)
depends=(glibc)
provides=(crawley)
conflicts=("crawley-bin" "crawley-git")
makedepends=(go binutils)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('aad6f97c1b33d1aada3db6e74bb3ad4d816b4e529649b825ecd45ec5577ba0ebc780519c00555bc016c94bdcc2a5b6ce9e47d6e9ff425093e3decb82e1d7742e')

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
