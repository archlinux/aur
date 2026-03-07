# Maintainer: Crymfox <sameur.bh@gmail.com>
pkgname=nac-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="n8n As Code - The missing GitOps link for n8n"
arch=('x86_64' 'aarch64')
url="https://github.com/crymfox/nac"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('nac')
conflicts=('nac')
source=("nac-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('48f1328399c1633c17962a691643312d9fca3fea1a0b0c7692459970f8074539')
build() {
  cd "nac-$pkgver"

  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # Build the binary explicitly named 'nac'
  go build -o nac \
    -ldflags "-X github.com/crymfox/nac/internal/config.Version=$pkgver \
              -X github.com/crymfox/nac/internal/config.Commit=aur \
              -X github.com/crymfox/nac/internal/config.Date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
    ./cmd/nac
  # Generate shell completions using the 'nac' binary
  ./nac completion bash >nac.bash
  ./nac completion zsh >nac.zsh
  ./nac completion fish >nac.fish
}
package() {
  cd "nac-$pkgver"

  # Install binary as 'nac'
  install -Dm755 nac "$pkgdir/usr/bin/nac"

  # Install shell completions
  install -Dm644 nac.bash "$pkgdir/usr/share/bash-completion/completions/nac"
  install -Dm644 nac.zsh "$pkgdir/usr/share/zsh/site-functions/_nac"
  install -Dm644 nac.fish "$pkgdir/usr/share/fish/vendor_completions.d/nac.fish"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
