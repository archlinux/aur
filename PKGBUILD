# Maintainer: Andy Stewart <lazycat.manatee@gmail.com>

pkgname=rime-ice-installer
pkgver=0.1.6
pkgrel=1
pkgdesc='TUI installer for Fcitx5, Rime Ice and Wanxiang on Arch Linux'
arch=('x86_64')
url='https://github.com/manateelazycat/rime-ice-installer'
license=('custom:unknown')
depends=('curl' 'dbus' 'dialog' 'git' 'glib2' 'sudo' 'unzip')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0637b19e524b552137639d73c4ebea7c6f1258e49de7f1916519acd7966c1f4')

_setup_go_env() {
  export GOPATH="$srcdir"
  export GOMODCACHE="$srcdir/pkg/mod"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
}

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  _setup_go_env

  go mod download
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  _setup_go_env
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -o "$pkgname" .
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  _setup_go_env

  go test ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
