# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.7.0
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
sha256sums=(
  '676aaabd2b725700958212aec5f4dbbaf4801605afa5c5ecf909d846af9c4712'
)
sha512sums=(
  '37532f3b0a05a80ad191d318389b8410e7bcdea4bc2630a3e7fce9e2378cf3910f7345945eee18e0294c6ad45c7ccb3187a4645b08f7cbd444048530880f2688'
)
b2sums=(
  '12af92cd4e1596b0e4f1a85891e57dc2acdb9dfd0b72c8f69cd355bacc03af326d4ccd427d12e7d4ba17aea48065ef1f403003c877f01e1201295dc05f5217e2'
)

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

# eof
