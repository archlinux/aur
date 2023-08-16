# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kindritskiy Maksym <kindritskiy.m@gmail.com>

pkgname=lets
pkgver=0.0.53
pkgrel=1
pkgdesc="CLI task runner for productive developers"
url="https://github.com/${pkgname}-cli/${pkgname}"
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('caee6e6cdcd0b37ef812ba4b89764dd4b82405f2c467e8e514d8d3d7404ccc5b9838ec761618486618fb82e4cc89e82c72630bacdbd17fa227eaf36848cf089a')

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
  install -D build/lets -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
