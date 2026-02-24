# Maintainer: Gallifreyan <gallifreyan@protonmai.ch>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ícar N. S. <icar.nin@protonmail.com>

pkgname=crawley
pkgver=1.7.17
pkgrel=2
pkgdesc="Simple web scraper"
arch=('x86_64')
url="https://github.com/s0rg/${pkgname}"
license=(MIT)
depends=(glibc)
provides=(crawley)
conflicts=("crawley-bin" "crawley-git")
makedepends=(go binutils)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('58067742346589943cf0a52755290f30b14bc20498781357ae5294ebd455754e0d778a80f381f2f6ed483136d0784390d87ccd401dd3901220254fa0e54863dd')

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
