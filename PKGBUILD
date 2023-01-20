# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gitin
pkgver=0.3.0
pkgrel=1
pkgdesc="Commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/gitin"
license=('BSD')
depends=('glibc')
makedepends=('cmake' 'go' 'git' 'pcre')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b146072559c45e30451232eabdcb626ba3b153a139a7520b7be19f1d0cc87197')

prepare() {
  if [ -d git2go ]; then
    rm -rf git2go
  fi
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
