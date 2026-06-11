# Maintainer: Ryan Rueger <aur@rueg.re>

pkgname=addchain-git
pkgdesc="Cryptographic Addition Chain Generation in Go"
url="https://github.com/mmcloughlin/addchain"
pkgrel=1
pkgver=20260611.6c4dbba
arch=(x86_64)
license=('BSD-3-Clause')
depends=()
makedepends=(git go)
provides=(addchain)
conflicts=(addchain)
source=(git+https://github.com/mmcloughlin/addchain.git)
sha256sums=(SKIP)

pkgver() {
  echo "$(date +%Y%m%d).$(git -C "$srcdir/addchain" rev-parse --short HEAD)"
}

prepare() {
  export GOCACHE="$srcdir/gocache"
  export GOMODCACHE="$srcdir/gomodcache"
  export GOPATH="$srcdir/gopath"
}

build() {
  cd "$srcdir/addchain/cmd/addchain"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\"" \
    -o addchain .
}

package() {
  cd "$srcdir/addchain"
  install -Dm755 "$srcdir/addchain/cmd/addchain/addchain" "${pkgdir}/usr/bin/addchain"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
