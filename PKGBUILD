# Maintainer: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=atlantis
pkgver=0.26.0
pkgrel=1
pkgdesc=" Terraform Pull Request Automation"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/runatlantis/atlantis"
license=('APACHE20')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/runatlantis/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5d303bd961af2ee317fcc0b5dedea3353fd8f995094b3d56882270253647fdc4')

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

