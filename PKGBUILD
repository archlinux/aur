pkgname=safelinks
pkgver=0.5.14
pkgrel=1
pkgdesc='Decoder for Microsoft Office 365 "Safe Links" URLs'
arch=('x86_64')
url="https://github.com/atc0005/safelinks"
license=('GPL')
makedepends=('go')
source=($pkgname-$pkgver.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('060c727c0ff01720ad1934ecf6e462a54b2e073b437defa7f5164caef29fb5f9')

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

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/usl "$pkgdir"/usr/bin/usl
  install -Dm755 build/dsl "$pkgdir"/usr/bin/dsl
  install -Dm755 build/dslg "$pkgdir"/usr/bin/dslg
}
