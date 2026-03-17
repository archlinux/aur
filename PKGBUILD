# Maintainer: Andy Stewart <lazycat.manatee@gmail.com>

pkgname=rime-ice-installer
_commit=807f822f80d775866687d7baa443dc3c665793c0
pkgver=0.0.0.r1.g807f822
pkgrel=1
pkgdesc='TUI installer for Fcitx5, Rime Ice and Wanxiang on Arch Linux'
arch=('x86_64')
url='https://github.com/manateelazycat/rime-ice-installer'
license=('custom:unknown')
depends=('curl' 'dbus' 'dialog' 'git' 'glib2' 'sudo' 'unzip')
makedepends=('go')
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('e3c9c781414dbc6d64783ba44e781be8fe75aeeadd4944bfefaa239ff3615c1b')

prepare() {
  cd "$srcdir/$pkgname-$_commit"

  export GOPATH="$srcdir"
  export GOMODCACHE="$srcdir/pkg/mod"

  go mod download
}

build() {
  cd "$srcdir/$pkgname-$_commit"

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
  cd "$srcdir/$pkgname-$_commit"

  export GOPATH="$srcdir"
  export GOMODCACHE="$srcdir/pkg/mod"

  go test ./...
}

package() {
  cd "$srcdir/$pkgname-$_commit"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
