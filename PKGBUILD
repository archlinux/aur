# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=criticality_score
pkgver=2.0.3
pkgrel=1
pkgdesc="Gives criticality score for an open source project"
arch=('i686' 'x86_64')
url="https://github.com/ossf/criticality_score"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/ossf/criticality_score/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7387d311e2ad09e6c0426c43bf191fc476bfcab95d28f9177133f4181e447f08')


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
