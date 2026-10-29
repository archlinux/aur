# Maintainer: Elmar Athmer <elmar+aur at athmer dot org>
pkgname=age-plugin-fido2-hmac
pkgver=0.5.0
pkgrel=1
pkgdesc='Age plugin to encrypt files with FIDO2 tokens using the hmac-secret extension'
arch=('x86_64' 'aarch64')
url='https://github.com/olastor/age-plugin-fido2-hmac'
license=('MIT')
depends=('glibc' 'libfido2')
makedepends=('go')
optdepends=('age: age encryption tool'
            'rage: Rust implementation of age')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dfdc7df03f444411bd531435f604b96c133350201e90b006e437829759d39883')

prepare() {
  cd "$pkgname-$pkgver"
  export GOFLAGS="-mod=readonly -modcacherw"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-linkmode=external -X main.Version=v$pkgver" \
    -o "$pkgname" \
    ./cmd/age-plugin-fido2-hmac
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
