# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rekor-git
pkgver=1.1.0.r11.gb0b8ecba
pkgrel=1
pkgdesc="Software supply chain transparency log"
arch=('i686' 'x86_64')
url="https://github.com/sigstore/rekor"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
checkdepends=('openssh')
provides=("rekor=$pkgver")
conflicts=('rekor')
source=("git+https://github.com/sigstore/rekor.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "rekor"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "rekor"

  go test \
    ./...
}

package() {
  cd "rekor"

  export GOBIN="$pkgdir/usr/bin"
  go install ./cmd/rekor-cli
  go install ./cmd/rekor-server

  install -d \
    "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/fish/vendor_completions.d" \
    "$pkgdir/usr/share/zsh/site-functions"

  "$pkgdir/usr/bin/rekor-cli" completion bash > "$pkgdir/usr/share/bash-completion/completions/rekor-cli"
  "$pkgdir/usr/bin/rekor-cli" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/rekor-cli.fish"
  "$pkgdir/usr/bin/rekor-cli" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_rekor-cli"

  "$pkgdir/usr/bin/rekor-server" completion bash > "$pkgdir/usr/share/bash-completion/completions/rekor-server"
  "$pkgdir/usr/bin/rekor-server" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/rekor-server.fish"
  "$pkgdir/usr/bin/rekor-server" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_rekor-server"
}
