# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Philipp Klein <philipptheklein@gmail.com>

pkgname=gdrive
pkgver=2.1.1
pkgrel=2
pkgdesc="Google Drive CLI Client"
arch=('x86_64')
url="https://github.com/prasmussen/gdrive"
license=('MIT')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

_gopkg="${url#https://}"
_gobuild=build/src/$_gopkg

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"    # -mod=readonly

prepare() {
  mkdir -p "$(dirname $_gobuild)"
  cp -a "$srcdir/$pkgname-$pkgver" $_gobuild

  export GOCACHE="$srcdir/cache"
  export GOPATH="$srcdir/build"
  go mod init $_gopkg
  go mod tidy -e
}

build() {
  export GOCACHE="$srcdir/cache"
  export GOPATH="$srcdir/build"
  go install $_gopkg@$pkgver
}

package() {
  install -Dm755 build/bin/gdrive -t "$pkgdir/usr/bin"
}

