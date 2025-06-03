pkgname=safelinks
pkgver=0.5.16
pkgrel=1
pkgdesc='Decoder for Microsoft Office 365 "Safe Links" URLs'
arch=('x86_64')
url="https://github.com/atc0005/safelinks"
license=('GPL')
makedepends=('go')
source=($pkgname-$pkgver.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c68d38a53ccb6d1a21a8cf22bac11d6bb0eab6db7da05a4cf25d0ec857091ac8')

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
