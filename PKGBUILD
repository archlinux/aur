# Maintainer: Matthew Schulkind <mschulkind@gmail.com>
pkgname=tilekeeper
pkgver=0.1.0
pkgrel=1
pkgdesc='Per-workspace tiling layout manager for Sway/Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/mschulkind-oss/tilekeeper'
license=('Apache-2.0')
optdepends=('sway: the Wayland compositor tilekeeper manages')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('32dcefca670b5fbb27daf8044ee9ac96da71f0759f4347e3b3127f5b554aa53e')

prepare() {
  cd "$pkgname-$pkgver"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS='-trimpath -mod=readonly -modcacherw'
  local built="$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT%H:%M:%SZ)"
  go build \
    -ldflags "-s -w -X main.version=v$pkgver -X main.commit=aur -X main.buildTime=$built -X main.treeState=clean" \
    -o build/tilekeeper ./cmd/tilekeeper
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/tilekeeper "$pkgdir/usr/bin/tilekeeper"
  install -Dm644 LICENSE          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md        "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/COMMANDS.md "$pkgdir/usr/share/doc/$pkgname/COMMANDS.md"
}
