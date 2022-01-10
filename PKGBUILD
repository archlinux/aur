# Maintainer: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=terraform-docs
pkgver=0.16.0
pkgrel=1
pkgdesc=" Generate documentation from Terraform modules in various output formats"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/terraform-docs/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e370fd106ca74caebc8632834cc28412a3a6a160952392da71f213515bba2085')

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

