# Maintainer: David Birks <david@birks.dev>

pkgname=mcptools
pkgver=0.7.0 # renovate: datasource=github-tags depName=f/mcptools
pkgrel=1
pkgdesc='Swiss Army Knife for MCP Servers'
arch=('x86_64')
url="https://github.com/f/mcptools"
license=('MIT')
makedepends=('go')
source=("https://github.com/f/mcptools/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1ddb84336c53e3816fe8820baac2471c24e63d2bb449b58941c31e0ad1b41b2db17eec0dd4740efc53a4bb8429a02ad7ee3488ee8b6d8de6a7668a3e7ee478f5')
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

  go build -o build -ldflags "-X main.Version=$pkgver" ./cmd/...
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
