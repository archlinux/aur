# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=deck
pkgver=1.23.0
pkgrel=1
pkgdesc='decK: Configuration management and drift detection for Kong and Kong Enterprise'
arch=('x86_64')
url="https://github.com/Kong/$pkgname"
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kong/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b3d4ef08f8c39e5bbb7d9284945d70e430646e8bddce9f1c18f66175322dc0da')
install=install.sh

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
  go build -o build -ldflags "-X github.com/kong/deck/cmd.VERSION=$pkgver -X github.com/kong/deck/cmd.COMMIT=SourceRelease" ./...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
