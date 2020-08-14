# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
# Maintainer: Miguel Mota <hello@miguelmota.com>
pkgname=cointop
pkgver=1.5.2
pkgrel=1
pkgdesc="An interactive terminal based UI application for tracking cryptocurrencies"
url="https://github.com/miguelmota/cointop"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('556dba09374f9a7847e9a8d18afa5240f97e2ab7dd3b0d1ba6397f885b20b3ff')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-s -ldflags=-w -ldflags=-X=github.com/miguelmota/cointop/cointop.version=v$pkgver"
  export GO111MODULE=on
  go build -o ctop .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  install -Dm755 "$pkgname-$pkgver/ctop" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
