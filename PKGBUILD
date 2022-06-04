# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.10.0
pkgrel=0
pkgdesc='Filesystem and git-based wiki engine written in Go using mycomarkup'
arch=('x86_64' 'armv7h')
url="https://github.com/bouncepaw/$pkgname"
license=('AGPL3')
depends=('git')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
provides=('mycorrhiza')
conflicts=('mycorrhiza')

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

  install -Dm0755 "mycorrhiza"        "$pkgdir/usr/bin/mycorrhiza"
  install -Dm0644 "README.md"         "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 "help/mycorrhiza.1" "$pkgdir/usr/share/man/man1/mycorrhiza.1"
}

sha256sums=(
  'f263fc45ab1c17face335def7df44f478ccd8db3562c548e9e4a8487e33f18c9'
)
sha512sums=(
  '763f1f3d6cfbacafa8ea5d26c36e6dad0a7dcf82efdbf7ba2e4773740504ea9949f58422a1ecdae1ca95708ada91a5790b1c5d7eb49415027ec1e7be9e633bbd'
)
b2sums=(
  'f039aabf8711e5872ec9c372dc98a1a77fec2e8b2027a686ac2e506bc6a2439e82ca737b1e00a2e8ee40e8f4ec798aeb55386cdd72289546eca97e3e3b1b5cb1'
)

# eof
