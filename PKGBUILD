# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote
pkgver=0.25.2
pkgrel=1
_pkgdate=1665136260
pkgdesc='Terminal-based, CRDT-backed, local-first, collaborative note-taking'
arch=('x86_64')
url='https://github.com/Sambigeara/fuzzynote'
license=('AGPL3')
makedepends=('go')
provides=('fuzzynote')
conflicts=('fuzzynote')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Sambigeara/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)

build() {
  cd "$pkgname-$pkgver" || exit 1

  # https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  unset GOPROXY

  go mod tidy

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver -X main.date=$_pkgdate" \
    -mod=readonly \
    -modcacherw \
    -o bin/fzn ./cmd/term
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 bin/fzn   "$pkgdir/usr/bin/fzn"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=(
  '328250ba90d4bc733013d37e06353186517490cf3046b808521a9df0fb67a1c0'
)
sha512sums=(
  '391c478eed0e1affccd2fc42bf73f71092e2ae1fe4342342d0985f5a0837c4cbc6bdc4a2f5c541cefc693c5c3b42262e6de26555991b6f7b30bffb1e39ea43ad'
)
b2sums=(
  'e230aebb1a90128609e249bc0703ee4d3c1ea0846dfbd07904a696d4d5c1c74a7acea2fd971ec6abe1039a675c9bdc082c1239f30404351b1fa025dd61ce742b'
)

# eof
