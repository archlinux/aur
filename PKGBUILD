# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=criticality_score
pkgver=2.0.2
pkgrel=1
pkgdesc="Gives criticality score for an open source project"
arch=('i686' 'x86_64')
url="https://github.com/ossf/criticality_score"
license=('apache')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/ossf/criticality_score/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fee396d728f3c0dc9711804ee9bc27388bdc4f0f299bf2c30bea343252b30efe')


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

build() {
  cd "$pkgname-$pkgver"

  go build \
    ./...
}

check() {
  cd "$pkgname-$pkgver"

  go test \
    ./...
}

package() {
  cd "$pkgname-$pkgver"

  GOBIN="$pkgdir/usr/bin" \
    go install \
      ./cmd/criticality_score \
      ./cmd/enumerate_github \
      ./cmd/scorer

  install -d "$pkgdir/usr/share/criticality_score"
  cp -r config "$pkgdir/usr/share/criticality_score"
}
