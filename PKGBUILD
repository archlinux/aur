# Maintainer ringo <ringo@deqc.xyz>
# Contributor: Atte Lautanala <atte@lautana.la>
# Contributor: Trevor Mosey <trevor dot mosey at gmail dot com>

pkgname=flyctl
pkgver=0.4.85
pkgrel=1
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url="https://github.com/superfly/flyctl"
license=("Apache-2.0")
makedepends=("go" "ruby-rake")
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('b64042b0c55eea8bc4e28f374e382b639c1850e5490ca646b8cfb7e6490af09bf1c03a44b26998b8ec26c94c871efa6d3c4effd33df7de2f18892c780d53a6e6')

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
