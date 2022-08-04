# Maintainer: slashformotion <slashformotion@archlinux.org>
# Author: slashformotion <slashformotion@archlinux.org>
pkgname=radioboat
pkgver=0.2.2
pkgrel=5
pkgdesc="A terminal web radio client, built with simplicity in mind"
arch=('x86_64')
url="https://github.com/slashformotion/radioboat"
license=('APACHE')
makedepends=('go' 'git')
depends=('mpv')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('16285c68ff897ce973ae5c2c4491d030b37aabeda050f92cbc93c533d9af77bc')
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