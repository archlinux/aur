# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.8.0
pkgrel=1
pkgdesc='Filesystem and git-based wiki engine written in Go using mycomarkup'
arch=('x86_64' 'armv7h')
url="https://github.com/bouncepaw/$pkgname"
license=('AGPL3')
depends=('git')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
provides=('mycorrhiza')
conflicts=('mycorrhiza' 'mycorrhiza-bin')

build() {
  cd "$pkgname-$pkgver" || exit 1

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go mod tidy

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -mod=readonly \
    -modcacherw \
     .

}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 "mycorrhiza" "$pkgdir/usr/bin/mycorrhiza"
  install -Dm0644 "README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=(
  '17d57dad9dc89886a5ea2a38ca99362daddab1425925cdb31b4a59e7bbfc7133'
)
sha512sums=(
  '9804b19424d33b891dc67949819ff035689d305011a4a7393c148de8d747191ebed0abfb1415f07b48cad49a774f5054446de1aa9ae4579de17236376e67de1a'
)
b2sums=(
  '8f1394597b41407bf97a30de6840883f919a52a558ff0487e8547f39a2aaa33c4dda7d3f51d09284b470444ae7b68aeb8ba1cd9e48bfd7208dcc1ef74c6d2d1b'
)

# eof
