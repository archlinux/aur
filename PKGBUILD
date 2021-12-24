# Maintainer: Amaan Hashmi-Ubhi <amaanhub at protonmail dot com>

pkgname=mangadesk
pkgver=0.7.3
pkgrel=1
pkgdesc='Terminal client for MangaDex'
arch=('x86_64')
url="https://github.com/darylhjd/mangadesk"
license=('MIT')
# according to namcap, this is needed
depends=('glibc')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e03108e8848b14bca9c90000b34f07538e7f5dcea0d05878914256c00218d3a113520a93f5ec2994c48a8272634670960d60295625439e79d65f332b5ef77f2b')

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
  go get -d ./...
  go build -o build ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
