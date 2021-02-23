# Maintainer: Gabriel Fontes <eu@misterio.me>
pkgname=lightsailctl
pkgver=1.0.1
pkgrel=1
pkgdesc='Amazon Lightsail CLI Extensions'
arch=('x86_64')
url="https://github.com/aws/lightsailctl"
license=('APACHE')
depends=('glibc')
makedepends=('go')
source=("$pkgname-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('e220fba3d9fe69f293b5263a2f653fd894558269511044d83b2d3c3782b4a801')

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
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
