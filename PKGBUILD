# Maintainer: Andy Stewart <lazycat.manatee@gmail.com>

pkgname=rime-ice-installer
pkgver=0.1.2
pkgrel=1
pkgdesc='TUI installer for Fcitx5, Rime Ice and Wanxiang on Arch Linux'
arch=('x86_64')
url='https://github.com/manateelazycat/rime-ice-installer'
license=('custom:unknown')
depends=('curl' 'dbus' 'dialog' 'git' 'glib2' 'sudo' 'unzip')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dca78ec7c00f66bf3e6197d736628817ffd09b4cd7489b34b27e4c7b89f5bd08')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  export GOPATH="$srcdir"
  export GOMODCACHE="$srcdir/pkg/mod"

  go mod download
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export GOPATH="$srcdir"
  export GOMODCACHE="$srcdir/pkg/mod"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  go build -o "$pkgname" .
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  export GOPATH="$srcdir"
  export GOMODCACHE="$srcdir/pkg/mod"

  go test ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
