# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Philipp Klein <philipptheklein@gmail.com>

pkgname=gdrive
pkgver=2.1.1
pkgrel=1
pkgdesc="Google Drive CLI Client"
arch=('x86_64')
url="https://github.com/prasmussen/gdrive"
license=('MIT')
makedepends=('dep' 'git' 'go')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

_gopkg=github.com/prasmussen/gdrive
_gobuild=build/src/$_gopkg

prepare() {
  mkdir -p "$(dirname $_gobuild)"
  cp -a "$srcdir/$pkgname-$pkgver" $_gobuild

  cd $_gobuild
  export GOPATH="$srcdir/build"
  dep init -skip-tools -no-examples
  dep ensure -update
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="$srcdir/build"
  go install $_gopkg@$pkgver
}

#check() {
#  export GOPATH="$srcdir/build"
#  go test $_gopkg@$pkgver
#}

package() {
  cd build
  install -Dm755 bin/gdrive "$pkgdir/usr/bin/gdrive"
}

