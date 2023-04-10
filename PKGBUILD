# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cosign-git
pkgver=2.0.1.r9.ga8f57b66
pkgrel=1
pkgdesc="Container Signing, Verification and Storage in an OCI registry"
arch=('i686' 'x86_64')
url="https://github.com/sigstore/cosign"
license=('Apache')
depends=('glibc' 'pcsclite')
makedepends=('git' 'go')
provides=("cosign=$pkgver")
conflicts=('cosign')
source=("git+https://github.com/sigstore/cosign.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "cosign"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "cosign"

  GODEBUG=x509sha1=1 \
    go test \
      ./...
}

package() {
  cd "cosign"

  GOBIN="$pkgdir/usr/bin" \
    go install ./cmd/cosign

  install -d \
    "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/fish/vendor_completions.d" \
    "$pkgdir/usr/share/zsh/site-functions"

  "$pkgdir/usr/bin/cosign" completion bash > "$pkgdir/usr/share/bash-completion/completions/cosign"
  "$pkgdir/usr/bin/cosign" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/cosign.fish"
  "$pkgdir/usr/bin/cosign" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_cosign"
}
