# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=deck
pkgver=1.41.3
pkgrel=1
pkgdesc='decK: Configuration management and drift detection for Kong and Kong Enterprise'
arch=('x86_64')
url="https://github.com/Kong/$pkgname"
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kong/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ccf2fe3513cc7f72636b7fbb9b7a50b740775d5c09731dfc2395bc1e577da1b6')
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
  # "Test_deployManifests" requires heavy dependency 'kind' (https://kind.sigs.k8s.io/)
  go test ./... -skip '^Test_deployManifests$'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
