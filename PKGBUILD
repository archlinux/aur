# Maintainer: David Birks <david@birks.dev>

pkgname=mcptools
pkgver=0.6.5
pkgrel=1
pkgdesc='Swiss Army Knife for MCP Servers'
arch=('x86_64')
url="https://github.com/f/mcptools"
license=('MIT')
makedepends=('go')
source=("https://github.com/f/mcptools/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ef740e70b8e49b89c3d52768143c33afa3cd06b564c90a932de01c78db06300203a2bc3fecc7d17546a9b015ecbfa7c2bd5aae5ab1ceb77a92c089241e1f8954')
options=('!lto' '!debug')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"

  # Config from https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build ./cmd/...
}

package() {
  cd "$pkgname-$pkgver"

  # Install the binary
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname

  # Install shell completion
  install -Dm644 <( "$pkgdir"/usr/bin/$pkgname completion bash ) \
    "$pkgdir"/usr/share/bash-completion/completions/$pkgname
  install -Dm644 <( "$pkgdir"/usr/bin/$pkgname completion zsh ) \
    "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
  install -Dm644 <( "$pkgdir"/usr/bin/$pkgname completion fish ) \
    "$pkgdir"/usr/share/fish/completions/$pkgname.fish
}
