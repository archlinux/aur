# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=sql-tap
pkgver=0.3.2
pkgrel=1
pkgdesc="Watch SQL traffic in real-time with a TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/mickamy/sql-tap"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('eebee6d6c1175c1be719a3d4a5005b6f3b16ef0826b361d0b753a9c020373fd3')

prepare() {
  cd "$pkgname-$pkgver"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode=external -X main.version=$pkgver" -o "$pkgname" .
  go build -ldflags="-linkmode=external -X main.version=$pkgver" -o "${pkgname}d" "./cmd/${pkgname}d"

  # Clean up deps
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "${pkgname}d" "$pkgdir/usr/bin/${pkgname}d"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
