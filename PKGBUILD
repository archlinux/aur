# Maintainer: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=atlantis
pkgver=0.19.8
pkgrel=1
pkgdesc=" Terraform Pull Request Automation"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/runatlantis/atlantis"
license=('APACHE20')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/runatlantis/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('12f2e3d74264b4457d0a7766f8b4f580984a025fcdb3d443b8aad85f036994d4')

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

