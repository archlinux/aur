# Maintainer: Marek Küthe <m.k@mk16.de>

pkgname=meshname
pkgver=0.2.0
pkgrel=1
pkgdesc="Distributed naming system for IPv6 mesh networks"
arch=('x86_64')
url="https://github.com/zhoreeq/meshname/"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zhoreeq/meshname/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha512sums=(ac9f55c4682d9718159a35cf84ce7cb5d84030f063d90b3d1c741c6535e710f4cb24f4fa48f428a4ff679436ab45d95d21aa51abba2ed0902bbd30815ac972e2)

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make
}

check() {
  cd "$pkgname-$pkgver"

  make test
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 meshnamed "$pkgdir/usr/bin/meshnamed"
  install -Dm644 meshnamed.service "$pkgdir/usr/lib/systemd/system/meshnamed.service"
  install -Dm644 protocol.md "$pkgdir/usr/share/doc/meshname/protocol.md"
}
