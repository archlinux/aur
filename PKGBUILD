# Maintainer: Patrik Cyvoct <patrik at ptrk dot io>
# Contributor: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=scaleway-cli
pkgver=2.3.1
pkgrel=1
pkgdesc="Scaleway CLI is a tool to help you pilot your Scaleway infrastructure directly from your terminal."
arch=('x86_64')
url="https://scaleway.com"
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/scaleway/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('36c362ad87a5c81dc1cf4a0aaa6e9ba323d59ecdf49e351039b41d25e13c974a')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-X main.BuildDate=$(date -u '+%Y-%m-%dT%I:%M:%S%p')" \
    -o scw ./cmd/scw/main.go
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 scw "$pkgdir/usr/bin/scw"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Leaving the autocomplete out for now since it depends on bash-completion
  # It can still be installed with scw autocomplete install
  #PATH=.:$PATH scw autocomplete script shell=zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_scw"
  #PATH=.:$PATH scw autocomplete script shell=bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/scw"
}

# vim:set ts=2 sw=2 et:
