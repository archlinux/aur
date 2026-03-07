# Maintainer: Crymfox <sameur.bh@gmail.com>
pkgname=nac
pkgver=0.1.2
pkgrel=1
pkgdesc="n8n As Code - The missing GitOps link for n8n"
arch=('x86_64' 'aarch64')
url="https://github.com/crymfox/nac"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('48f1328399c1633c17962a691643312d9fca3fea1a0b0c7692459970f8074539')
build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "$pkgname" \
    -ldflags "-X github.com/crymfox/nac/internal/config.Version=$pkgver \
              -X github.com/crymfox/nac/internal/config.Commit=aur \
              -X github.com/crymfox/nac/internal/config.Date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
    ./cmd/nac
  ./nac completion bash >"$pkgname.bash"
  ./nac completion zsh >"$pkgname.zsh"
  ./nac completion fish >"$pkgname.fish"
}
package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 "$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
