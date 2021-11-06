# Maintainer: willemw <willemw12@gmail.com>

pkgname=gdrive-git
pkgver=2.1.0.r35.gfb08fe2
pkgrel=2
pkgdesc="Google Drive CLI Client"
arch=('x86_64')
url="https://github.com/prasmussen/gdrive"
license=('MIT')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip' '!emptydirs')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

_gopkg="${url#https://}"
_gobuild=build/src/$_gopkg

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"    # -mod=readonly

pkgver() {
  git -C $pkgname describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$(dirname $_gobuild)"
  cp -a "$srcdir/$pkgname" $_gobuild

  export GOCACHE="$srcdir/cache"
  export GOPATH="$srcdir/build"
  go mod init $_gopkg
  go mod tidy -e
}

build() {
  export GOCACHE="$srcdir/cache"
  export GOPATH="$srcdir/build"
  go install $_gopkg@latest
}

package() {
  install -Dm755 build/bin/gdrive -t "$pkgdir/usr/bin"
}

