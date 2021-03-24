# Maintainer: Jeff Wright <jeff@teamjk.page>
pkgname=wesher
pkgver=0.2.6
pkgrel=2
pkgdesc='Create and manage an encrypted mesh overlay network using wireguard'
arch=('x86_64')
url="https://github.com/costela/$pkgname"
license=('GPL')
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" wesher.service)

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
  install -Dm755 wesher.service "$pkgdir"/usr/lib/systemd/system/wesher.service
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
md5sums=('209febe054a716466ac9987081e01eac'
         'a1c62e4939c72c3a4068a1829fced041')
