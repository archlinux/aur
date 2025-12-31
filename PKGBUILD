# Maintainer: ddvital <ddvital@gmail.com>
pkgname=cliptui
pkgver=1.0.1
pkgrel=1
pkgdesc="A beautiful terminal-based clipboard history manager"
arch=('x86_64')
url="https://github.com/ddVital/ClipTUI"
license=('MIT')
depends=('xsel')
optdepends=('wl-clipboard: Wayland clipboard support')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('63d9ccc3af2eec412b569091e5611c36b610e329d787595d87dcfe87b3e034ab')

build() {
  cd "ClipTUI-$pkgver"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode external -extldflags \"${LDFLAGS}\" -s -w -X main.version=$pkgver" \
    -o $pkgname ./cmd/cliptui
}

check() {
  cd "ClipTUI-$pkgver"
  go test ./...
}

package() {
  cd "ClipTUI-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install systemd user service
  if [ -f systemd/cliptui.service ]; then
    install -Dm644 systemd/cliptui.service "$pkgdir/usr/lib/systemd/user/cliptui.service"
  fi
}
