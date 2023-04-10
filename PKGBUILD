# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sget-git
pkgver=r266.g99e7b91
pkgrel=1
pkgdesc="Program for automatic verification of signatures and integration with Sigstore's binary transparency log"
arch=('i686' 'x86_64')
url="https://github.com/sigstore/sget"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
provides=("sget=$pkgver")
conflicts=('sget')
source=("git+https://github.com/sigstore/sget.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "sget"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

check() {
  cd "sget"

  go test \
    ./...
}

package() {
  cd "sget"

  GOBIN="$pkgdir/usr/bin" \
    go install ./...

  install -d \
    "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/fish/vendor_completions.d" \
    "$pkgdir/usr/share/zsh/site-functions"

  "$pkgdir/usr/bin/sget" completion bash > "$pkgdir/usr/share/bash-completion/completions/rekor-cli"
  "$pkgdir/usr/bin/sget" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/rekor-cli.fish"
  "$pkgdir/usr/bin/sget" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_rekor-cli"
}
