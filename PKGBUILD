# shellcheck disable=SC2034 # unused var
# shellcheck disable=SC2154 # var referenced but not assigned
# shellcheck disable=SC2164 # cd might fail
# Maintainer: Štěpán Němec <stepnem@smrk.net>
pkgname=bgpipe
pkgver=0.22.1
pkgrel=1
pkgdesc='BGP reverse proxy and firewall'
arch=(x86_64)
url='https://github.com/bgpfix/bgpipe'
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('21211a75a2f234677dd4bca590bd2f3e5f193218b6d4122f5ff2676761100720')

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
