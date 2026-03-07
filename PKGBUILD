# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=sql-tap
pkgver=0.2.7
pkgrel=1
pkgdesc="Watch SQL traffic in real-time with a TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/mickamy/sql-tap"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4c8ea2bc46d6f4ec8f03175c7e8861515e51e89261b08d4509ef5fd3d0d7360f')

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
