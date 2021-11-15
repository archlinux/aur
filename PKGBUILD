# Maintainer: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=chaoskube
pkgver=0.21.0
pkgrel=1
pkgdesc="Chaoskube periodically kills random pods in your Kubernetes cluster"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/linki/chaoskube"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linki/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b0747be3fe27a33e81e8b6b6cbdbf9b5111a65bcadce16bd5eea6aafd58986fd')

prepare(){
  cd "$pkgname-$pkgver"

  # Prevent creation of a `go` directory in one's home.
  # Sometimes this directory cannot be removed with even `rm -rf` unless
  # one becomes root or changes the write permissions.
  export GOPATH="$srcdir/gopath"
  go clean -modcache
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "bin/$pkgname"

  # Clean mod cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin/"
}

