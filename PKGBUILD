# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote
pkgver=0.25.5
pkgrel=1
_pkgdate=1669972080
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
  '342d92973ac0f06a7cda5cdda1049cc7b295478ecfcc7af550ea8c47ecf164c8'
)
sha512sums=(
  'd460229152cc3a3e1a31d5bdb0b533d120af1a88c976d4a1680c0f0afe2ba54e6bf3b4f30b23cff2bcde3cb3b10a7c85c988ecf46c32a9e2553148f285ae8a25'
)
b2sums=(
  'a34c11c62f7c72ef72e39ae8e8ccbf8ddb5be5f73f9e574c7102aa9002651b6a8da80cd140757775e99bcb20a511f4a300c4d454b2e6645429309900afb46ae7'
)

# eof
