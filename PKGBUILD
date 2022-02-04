# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Alex Gu <gualse.mail@yandex.com>
# -*- mode: sh -*-

pkgname='mycorrhiza'
pkgver=1.8.1
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
  '891ac0896f590331d7071ce781007534bf74c1e768fa6c194a9b52019f0370e7'
)
sha512sums=(
  'b5a41f5413b9c72dba13c47043c8e5ab38b25447a1bd04d81b4e4035d5299621fe568d021188f4ba478a32ca35889734b2cb2d29d3ee901e6818b9499ee34dde'
)
b2sums=(
  '25eb60141f63ce50ce78dd11d685d50798f0b3294f583fd853cecc4bbcd5ac98c87e85c02b0caa6d63776fa8817bc00b118e15b6ec480c5dcbbdb7b7d90705d6'
)

# eof
