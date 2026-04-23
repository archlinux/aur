# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=cymbal
pkgver=0.12.0
pkgrel=1
pkgdesc="Language-agnostic code navigation CLI powered by tree-sitter"
arch=('x86_64' 'aarch64')
url="https://github.com/1broseidon/cymbal"
license=('MIT')
depends=('gcc-libs')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/1broseidon/cymbal/archive/v$pkgver.tar.gz")
sha256sums=('a1dbe190c63186bf7fd7c36cf0553b9322a4ef25cc96fca4b5886ab4d68fe8eb')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CFLAGS='-DSQLITE_ENABLE_FTS5'
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export LDFLAGS="-linkmode=external -X github.com/1broseidon/cymbal/cmd.version=v${pkgver}"
  go build -ldflags "$LDFLAGS" -o "$pkgname" .
}

check() {
  cd "$pkgname-$pkgver"
  export CGO_CFLAGS='-DSQLITE_ENABLE_FTS5'
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
