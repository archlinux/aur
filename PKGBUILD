# Maintainer: Joshua Carnes <jtcarnes2@gmail.com>
pkgname=gotests
pkgver=1.6.0
pkgrel=2
pkgdesc='Golang commandline tool that generates table driven tests based on its target source files function and method signatures'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/cweill/$pkgname"
license=('Apache')
depends=(glibc)
makedepends=('go>=1.6')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('f0236dbebd8a3fd19ec4260f490cb164240e1d518d3971b42872978f7a50c040')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/${pkgname} gotests/*.go
}

check() {
  cd "$pkgname-$pkgver/${pkgname}"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
