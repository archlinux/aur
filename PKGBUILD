# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=criticality_score
pkgver=2.0.4
pkgrel=1
pkgdesc="Gives criticality score for an open source project"
arch=('i686' 'x86_64')
url="https://github.com/ossf/criticality_score"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/ossf/criticality_score/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('912e9115c9bfea9d0ba7d29a20779c9aef515d99f088c9786c3942b624a522b8')


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
      ./cmd/collect_signals \
      ./cmd/criticality_score \
      ./cmd/csv_transfer \
      ./cmd/enumerate_github \
      ./cmd/scorer

  install -d "$pkgdir/usr/share/criticality_score"
  cp -r config "$pkgdir/usr/share/criticality_score"
}
