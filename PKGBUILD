# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fulcio-git
pkgver=1.2.0.r18.ga660246
pkgrel=1
pkgdesc="Sigstore OpenID Connect public key infrastructure"
arch=('i686' 'x86_64')
url="https://github.com/sigstore/fulcio"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
provides=("fulcio=$pkgver")
conflicts=('fulcio')
source=("git+https://github.com/sigstore/fulcio.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "fulcio"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "fulcio"

  go test \
    ./...
}

package() {
  cd "fulcio"

  GOBIN="$pkgdir/usr/bin" \
    go install ./
}
