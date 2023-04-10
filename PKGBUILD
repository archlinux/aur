# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=criticality_score-git
pkgver=2.0.2.r7.ga486176
pkgrel=2
pkgdesc="Gives criticality score for an open source project"
arch=('i686' 'x86_64')
url="https://github.com/ossf/criticality_score"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
provides=("criticality_score=$pkgver")
conflicts=('criticality_score')
source=("git+https://github.com/ossf/criticality_score.git")
sha256sums=('SKIP')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "criticality_score"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "criticality_score"

  go build \
    ./...
}

check() {
  cd "criticality_score"

  go test \
    ./...
}

package() {
  cd "criticality_score"

  GOBIN="$pkgdir/usr/bin" \
    go install \
      ./cmd/criticality_score \
      ./cmd/enumerate_github \
      ./cmd/scorer

  install -d "$pkgdir/usr/share/criticality_score"
  cp -r config "$pkgdir/usr/share/criticality_score"
}
