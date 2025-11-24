# Maintainer: Your name <bros at brocode dot sh>

pkgname=rose-pine-bloom
pkgver=3.0.1
pkgrel=4
pkgdesc="Generate Rosé Pine themes"
arch=('x86_64')
url="https://github.com/rose-pine/rose-pine-bloom"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('257b0a66db0cef2acf51df009726aa51fc1a6044bf8692527f41e724994c8f4c')

prepare() {
  cd "$pkgname-$pkgver"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  go build -o bloom -ldflags "-X github.com/rose-pine/rose-pine-bloom/cmd.version=$pkgver" main.go
  mkdir -p completions
  ./bloom completion bash > completions/bloom
  ./bloom completion zsh > completions/_bloom
  ./bloom completion fish > completions/bloom.fish
}

check() {
  cd "$pkgname-$pkgver"
  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 bloom -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 completions/bloom "$pkgdir/usr/share/bash-completion/completions/bloom"
  install -D -m644 completions/_bloom "$pkgdir/usr/share/zsh/site-functions/_bloom"
  install -D -m644 completions/bloom.fish "$pkgdir/usr/share/fish/vendor_completions.d/bloom.fish"
}
