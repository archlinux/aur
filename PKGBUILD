# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote
pkgver=0.25.3
pkgrel=1
_pkgdate=1665302160
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
  'b46c59ef00d7d6b3fcbc127023a18a6c35f54fa948eee2d6f4b01632a8fdcf0d'
)
sha512sums=(
  'c2263a1d3aba0acbfe3a35b1b6bc2b169e1824fa324cb22008dc0adc5a81a45d46cc3aa64245e10077863145d4bfcf7d9937b5ca7f7dbbbaa6038bb1955979d4'
)
b2sums=(
  'cd441abcdcc7adc07290035207cb0372ff9733c3840a04584927e8f55dbeee35efffe3a91c86dda28ab65313658795fb171ff27aa988cd3e3658762e78473ca7'
)

# eof
