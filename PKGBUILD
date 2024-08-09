# Maintainer: Kindritskiy Maksym <kindritskiy.m@gmail.com>
# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kindritskiy Maksym <kindritskiy.m@gmail.com>
pkgname=lets
pkgver=0.0.54
pkgrel=1
pkgdesc="CLI task runner for productive developers"
url="https://github.com/${pkgname}-cli/${pkgname}"
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b31ab8e6ec85cbba03080a8fc986b00bd69a82efef03e9d94576093b3ff9bee47b17fd3c47308fa60b7e7e08102179fb3ad67af5c37085498d849b9b7e0f910d')

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
  go build -o build -ldflags="-linkmode=external -X main.version=$pkgver"
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
  install -D build/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
