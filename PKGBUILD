# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=sql-tap
pkgver=0.3.0
pkgrel=1
pkgdesc="Watch SQL traffic in real-time with a TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/mickamy/sql-tap"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('99e76c7c4ec24337cb47953326198f219ef1b4b8ddbcb19c862184191ba0209d')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/go"
  go mod download
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

  # Make sure go path is writable so it can be cleaned up
  chmod -R u+w "$srcdir/go"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "${pkgname}d" "$pkgdir/usr/bin/${pkgname}d"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
