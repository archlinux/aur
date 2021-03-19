# Maintainer: ml <>
_pkgname=probe-cli
pkgname=ooniprobe-cli
pkgver=3.8.0
pkgrel=1
pkgdesc='Next generation OONI Probe CLI'
arch=('x86_64')
url='https://ooni.org/'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("https://github.com/ooni/probe-cli/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('65bc4e592cadb99530be713798308d6950f67240bff6d90f2760fde11d750a83')

prepare() {
  cd "$_pkgname-$pkgver"
  # need to fetch files before we can build
  # internal/engine/resourcesmanager/asn.mmdb.gz
  # internal/engine/resourcesmanager/country.mmdb.gz
  # checksums are verified by code
  go run ./internal/cmd/getresources
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-ldflags=-linkmode=external -buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build ./cmd/ooniprobe
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 ooniprobe -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
