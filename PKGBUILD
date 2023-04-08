# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.14.0
pkgrel=1
pkgdesc='Filesystem and git-based wiki engine written in Go using mycomarkup'
arch=('x86_64' 'armv7h')
url="https://codeberg.org/bouncepaw/$pkgname"
license=('AGPL3')
depends=('git' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
provides=('mycorrhiza')
conflicts=('mycorrhiza')

build() {
  cd "$pkgname" || exit 1

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
  cd "$pkgname" || exit 1

  install -Dm0755 "mycorrhiza"        "$pkgdir/usr/bin/mycorrhiza"
  install -Dm0644 "README.md"         "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 "help/mycorrhiza.1" "$pkgdir/usr/share/man/man1/mycorrhiza.1"
}

sha256sums=(
  'bab2b7c18c00053404edadea0aed24f5ef383ccd876ee472810d9530b8854573'
)
sha512sums=(
  '9e52821db79ac15f309a376b7abe2001e7f214e9ce8e4cbabd1e80db4c37e7fdfd55b416ce9f90c673ac40b5c0fbc6d0777e253f8d92acccb0926e8d2d698818'
)
b2sums=(
  '3c2b78d28130b5b23bc2c456a771ddfd9202ea80d7ce68bcb98b7721d787bfc0357052fcb189bc936e50e8c152124f6ddd4ec62efa52315f85e08434cc39ab7e'
)

# eof
