# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=deck
pkgver=1.65.3
pkgrel=1
pkgdesc='decK: Configuration management and drift detection for Kong and Kong Enterprise'
arch=('x86_64')
url="https://github.com/Kong/$pkgname"
license=('Apache-2.0')
makedepends=('go')
_tarball_sha256sum=643f97800b401ac1b981b055a56ad42e368dc443cd05c3ae64c5dae55915dd54
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
