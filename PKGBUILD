# Maintainer: Gabriel M. Dutra <nulldutra@gmail.com>

pkgname=atlantis
pkgver=0.18.2
pkgrel=1
pkgdesc=" Terraform Pull Request Automation"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/runatlantis/atlantis"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/runatlantis/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('72733047a46b937aaecb8d3b8848a2f5fcd40dfb25a613ade989a7a2f313519e')

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

