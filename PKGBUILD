# Maintainer: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=tfmigrate
pkgver=0.3.0
pkgrel=1
pkgdesc="A Terraform state migration tool for GitOps"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/minamijoyo/tfmigrate"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/minamijoyo/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9baa141c2ba36e1190bbf92a70f7a58db2f9b009db5c645a50f9e23a89d5903c')

prepare(){
  cd "$pkgname-$pkgver"

  # Prevent creation of a `go` directory in one's home.
  # Sometimes this directory cannot be removed with even `rm -rf` unless
  # one becomes root or changes the write permissions.
  export GOPATH="$srcdir/gopath"
  go clean -modcache

  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/$pkgname"

  # Clean mod cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
}

