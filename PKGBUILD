# shellcheck disable=SC2034 # unused var
# shellcheck disable=SC2154 # var referenced but not assigned
# shellcheck disable=SC2164 # cd might fail
# Maintainer: Štěpán Němec <stepnem@smrk.net>
pkgname=bgpipe
pkgver=0.11.0
pkgrel=1
pkgdesc='BGP reverse proxy and firewall'
arch=(x86_64)
url='https://github.com/bgpfix/bgpipe'
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b43b229e1c2e1e5c7f29b366ebc91984593f83607a1922d1a33747379c78f4a4')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
