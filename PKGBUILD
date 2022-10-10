# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote
pkgver=0.25.4
pkgrel=1
_pkgdate=1665334440
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
  '00994238a4b4105134a514cc1c48536a58f2f21b8576e5a4d5d288574c3eeed7'
)
sha512sums=(
  '455e41012be1428e83eb7f912c4a6c65b0a7d65519c37627fa0c3e4ad272ffb46bfa7cb42d46cf3d2e2fa38609e26e4621d5a3054d4fb508a6c17b8b82e81dde'
)
b2sums=(
  'ebe3ac23b9e840d77ff265deb6c99fe6d215348ad6cd76104cde735e0e61788996849bd2b076cfc464fa08cbce59c55bfb02fc0d2324478dcbd24e87a98fa604'
)

# eof
