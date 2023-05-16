# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kindritskiy Maksym <kindritskiy.m@gmail.com>

pkgname=lets
pkgver=0.0.50
pkgrel=1
pkgdesc="CLI task runner for productive developers"
url="https://github.com/${pkgname}-cli/${pkgname}"
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('39b1f64d5763eb40c97e67216c9297f6b779015dd251c3481489ba1f07eb3a9f00457024312bf84e7706d59e05e543b301c227eb959502e4c9250a3c9d2a26ca')

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
