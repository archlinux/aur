# Maintainer: David Birks <david@birks.dev>

pkgname=mcptools
pkgver=0.7.1 # renovate: datasource=github-tags depName=f/mcptools
pkgrel=1
pkgdesc='Swiss Army Knife for MCP Servers'
arch=('x86_64')
url="https://github.com/f/mcptools"
license=('MIT')
makedepends=('go')
source=("https://github.com/f/mcptools/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('34ac24bd20c0e06bb7c7b9b6ac8274d6ed5ce53827e07b03d7065b5674ffab8845dab2f50e734a79e7c722a1275de5b0583d51eb324ba075c4ee00e66a0b7437')
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
  export GOFLAGS="-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw"

  go build -o build -ldflags "-linkmode=external -X main.Version=$pkgver" ./cmd/...
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
