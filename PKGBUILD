# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=align
pkgver=1.1.3
pkgrel=2
pkgdesc="A general purpose application for aligning text"
arch=('x86_64')
url="https://github.com/Guitarbum722/${pkgname}"
license=(MIT)
depends=(glibc)
makedepends=(go)
conflicts=(festival)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c27f9c295eecaf68923208105913cf92651fbbad607f107d544eb2abe22196e70ccc10985a8bbbd19b429cae33a2ad89c415fa8c267439a7c4115bdbf5f9e0a6')

prepare() {
  cd ${pkgname}-${pkgver}
  mkdir -p build
  go mod tidy
}

build() {
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd ${pkgname}-${pkgver}
  go build -o build -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\"" ./...
}

check() {
  cd ${pkgname}-${pkgver}
  go test ./...
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 build/align -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
