# Maintainer: Steven Tang <xosdy.t at gmail dot com>

pkgname=simpread-sync-git
pkgver=v0.8.0.r2.g28216c2
pkgrel=1
pkgdesc='SimpRead sync server'
arch=('x86_64')
url="https://github.com/j1g5awi/simpread-sync"
license=('MIT')
optdepends=('pandoc')
makedepends=('git' 'go')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly"
  go build ./...
}

package() {
  cd "$srcdir"/"$pkgname"
  install -Dm755 simpread-sync -t "$pkgdir"/usr/bin/
  install -Dm644 systemd/system/simpread-sync@.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 systemd/user/simpread-sync.service -t "$pkgdir"/usr/lib/systemd/user/
}
