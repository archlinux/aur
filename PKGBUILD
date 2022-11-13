# Maintainer: slashformotion <slashformotion@archlinux.org>
# Author: slashformotion <slashformotion@archlinux.org>
pkgname=radioboat
pkgver=0.2.3
pkgrel=6
pkgdesc="A terminal web radio client, built with simplicity in mind"
arch=('x86_64')
url="https://github.com/slashformotion/radioboat"
license=('APACHE')
makedepends=('go' 'git')
depends=('mpv')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('675865e1686c44fccaae3f8f1ca87ad8b76f9267265f8a9750ac16adef565860')
provides=('radioboat')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download -x
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o build/radioboat -ldflags "-s -w -X github.com/slashformotion/radioboat/internal/buildinfo.Version=v$pkgver -X github.com/slashformotion/radioboat/internal/buildinfo.Commit=notset -X github.com/slashformotion/radioboat/internal/buildinfo.BuildDate=notset -X github.com/slashformotion/radioboat/internal/buildinfo.VendorInfo=builtwiththeAUR" $GOFLAGS
}
 
package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}