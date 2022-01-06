# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gitin
pkgver=0.2.5
pkgrel=2
pkgdesc="Commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/gitin"
license=('BSD')
depends=('libssh2')
makedepends=('go' 'git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('01c831230f9c5952ed43755d0503e6fcee7c1e91613f06cff28606d03115d727')

prepare() {
  export GOPATH="$srcdir/gopath"
  go clean -modcache

  if [ -d "$srcdir/git2go" ]; then
    rm -rf "$srcdir/git2go"
  fi
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make

  # Clean mod cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
