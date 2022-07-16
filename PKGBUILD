# Maintainer: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=chaoskube
pkgver=0.24.0
pkgrel=1
pkgdesc="Chaoskube periodically kills random pods in your Kubernetes cluster"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/linki/chaoskube"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linki/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('07b2771aa2ef67b1c254e29c5d25f5c3d619e60eaebf6a45b3783257036e512e')

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

