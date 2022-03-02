# Maintainer: Patrik Cyvoct <patrik at ptrk dot io>
# Contributor: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=scaleway-cli
pkgver=2.4.0
pkgrel=2
pkgdesc="Scaleway CLI is a tool to help you pilot your Scaleway infrastructure directly from your terminal."
arch=('x86_64')
url="https://scaleway.com"
license=('Apache')
makedepends=('go' 'git')
optdepends=(
  'bash-completion: Bash completions'
  'zsh-completions: ZSH completitons'
)
source=("https://github.com/scaleway/$pkgname/archive/v${pkgver}.tar.gz")

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
  ./scw autocomplete script shell=zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_scw"
  ./scw autocomplete script shell=bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/scw"
}

sha256sums=('7baa6d7af5602703bc9b1f54beb5a36642151cc12d6584d6ab76df8bb088365e')
# vim:set ts=2 sw=2 et:
