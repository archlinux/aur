# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kindritskiy Maksym <kindritskiy.m@gmail.com>

pkgname=lets
pkgver=0.0.52
pkgrel=1
pkgdesc="CLI task runner for productive developers"
url="https://github.com/${pkgname}-cli/${pkgname}"
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('94704c9f121f6a804fd54afe9c803b7fc7fc32254dd1277c60a409e2fc73db6d232a87a64caaa1fa54afb3aec764ad0d57817d9f544b939d252e72abd2245aff')

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
