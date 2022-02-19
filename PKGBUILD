# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.8.2
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
  'b89973c0bb0833040efc61d9420d9ae5eaf11aa8cffab5c91bf6e4ef97627583'
)
sha512sums=(
  'fff711b48d3fc51ac9c64c0ae50a9c4f82ef2b26a65aa2060f1f459d3d8caac4f35760a9fca5a4ca4031720383aeefb16cbb8f1445079914a2129b9dae406a97'
)
b2sums=(
  '049237f2360ff794e59e8db8051b21d5d7b75ee22d49afb50ce41fd8fb91a2ab08c04381219e06f1fc9e43f5b34619864f366340344f87625d1c1c2b8bed72e1'
)

# eof
