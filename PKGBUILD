# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.14.0
pkgrel=2
pkgdesc='Filesystem and git-based wiki engine written in Go using mycomarkup'
arch=('aarch64' 'armv7h' 'x86_64')
url="https://codeberg.org/bouncepaw/$pkgname"
license=('AGPL3')
depends=('git' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
options=('lto')

prepare() {
  cd "$pkgname"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  mkdir -p build
  go mod tidy
}

build() {
  cd "$pkgname"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -mod=readonly \
    -modcacherw \
    -o build \
     .
}

package() {
  cd "$pkgname"

  install -Dm0755 "build/mycorrhiza"  "$pkgdir/usr/bin/mycorrhiza"
  install -Dm0644 "README.md"         "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 "help/mycorrhiza.1" "$pkgdir/usr/share/man/man1/mycorrhiza.1"
}

sha256sums=(
  'bab2b7c18c00053404edadea0aed24f5ef383ccd876ee472810d9530b8854573'
)
b2sums=(
  '3c2b78d28130b5b23bc2c456a771ddfd9202ea80d7ce68bcb98b7721d787bfc0357052fcb189bc936e50e8c152124f6ddd4ec62efa52315f85e08434cc39ab7e'
)

# eof
