# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=agebox
pkgver=0.8.0
pkgrel=1
pkgdesc='Git repository encryption tool'
arch=('x86_64' 'i386')
url='https://github.com/slok/agebox'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('35284710da7874452f4107ca0dd7c8b0dd1ae337f63ddc0677fb7ce84777f5a9')

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
  go build -o build ./...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
}
