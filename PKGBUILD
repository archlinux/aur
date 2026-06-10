# Maintainer: Alex Oleshkevich <alex.oleshkevich@gmail.com>
pkgname=niri-autolabel
pkgver=0.1.3
pkgrel=1
pkgdesc="Labels niri workspaces from their window contents via OpenRouter"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/niri-autolabel"
license=('MIT')
depends=('niri')
makedepends=('go')
_upstream=niri-autolabel
source=("$_upstream-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c192e2ec84ffbc6871ea3e891a41724286d2818764d60e89ea4f84931d7d19e4')

build() {
  cd "$_upstream-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go build -ldflags "-s -w -X main.version=$pkgver" -o "$pkgname" .
}

check() {
  cd "$_upstream-$pkgver"
  go test ./...
}

package() {
  cd "$_upstream-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 niri-autolabel.service "$pkgdir/usr/lib/systemd/user/niri-autolabel.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
