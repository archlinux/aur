# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=dstp
pkgver=0.4.23
pkgrel=1
pkgdesc="Run common networking tests against your site"
arch=('any')
url="https://github.com/ycd/dstp"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ab45012204cd68129fd05723dd768ea4a9ce08e2f6c2fa6468c2c88ab65c877')

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
  go build -o build cmd/dstp/dstp.go
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/dstp "$pkgdir"/usr/bin/$pkgname
}
