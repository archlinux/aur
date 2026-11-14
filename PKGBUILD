# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=mmdbinspect
pkgver=2.1.0
pkgrel=2
pkgdesc='look up records for one or more IPs/networks in one or more .mmdb databases'
arch=(x86_64 aarch64 armv7h)
url="https://github.com/maxmind/mmdbinspect"
license=('Apache-2.0 OR MIT')
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7019ae8d0856a62a6bf6eb54efbd813a0c4b23c8ea650033d9e803f2a70d224f22bdd98eca8140a4401700995bced328f4a741e80aacbafd87b87c92cf755e04')

build() {
  cd $pkgname-$pkgver

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o $pkgname \
    ./...
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 -t "$pkgdir"/usr/bin $pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
