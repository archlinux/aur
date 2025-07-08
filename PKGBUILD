# Maintainer: Atte Lautanala <atte@lautana.la>
# Contributor: Trevor Mosey <trevor dot mosey at gmail dot com>

pkgname=flyctl
pkgver=0.3.152
pkgrel=1
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://github.com/superfly/flyctl"
license=("Apache-2.0")
makedepends=(go)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('4f7f6cacd0c55e2361f1e9377c2fdf074b1680c567753c03739e59c7ed8b7929e9d009bf79b32a8d206d2f1411f529a790a7882d5b629584df2bbdc1fddd1871')

build() {
  cd "$pkgname-$pkgver"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make VERSION=$pkgver build
}

check() {
  make -C "$pkgname-$pkgver" test
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "bin/flyctl" "$pkgdir/usr/bin/flyctl"
  ln -s "/usr/bin/flyctl" "$pkgdir/usr/bin/fly"
}
