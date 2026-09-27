# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=deck
pkgver=1.67.0
pkgrel=1
pkgdesc='decK: Configuration management and drift detection for Kong and Kong Enterprise'
arch=('x86_64')
url="https://github.com/Kong/$pkgname"
license=('Apache-2.0')
makedepends=('go')
_tarball_sha256sum=c27829621e14399ef4cb9a95bb8f2a7a018471b49f4a4e68e3a51c7d69e5faea
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kong/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("$_tarball_sha256sum")
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
