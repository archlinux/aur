# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=go-mmproxy
pkgver=2.3.0
pkgrel=1
pkgdesc="Faster and stable implementation of mmproxy"
arch=(aarch64 x86_64)
url="https://github.com/kzemek/$pkgname"
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(go)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('6a167ec622eeb087047330255420045c5e8a375cc3a9becd4c032ab5a30e6c341fdb657b4407297b32086fa4f43d3decd3f671228cda16aa68bfe30e90ae618f')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|DynamicUser=yes|User=root|'                           $pkgname.service.example
  sed -i 's|:1000|:22|g'                                          $pkgname.service.example
  sed -i 's| -allowed-subnets /etc/go-mmproxy/net-prefixes.txt||' $pkgname.service.example
}

build() {
  cd $pkgname-$pkgver
  export GOCACHE="$srcdir"/go-build
  export GOPATH="$srcdir"/go
  export CGO_CPPFLAGS=$CPPFLAGS
  export CGO_CFLAGS=$CFLAGS
  export CGO_CXXFLAGS=$CXXFLAGS
  export CGO_LDFLAGS=$LDFLAGS
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/$pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -vDm 755 build/$pkgname             -t "$pkgdir"/usr/bin/
  install -vDm 644 $pkgname.service.example      "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -vDm 644 LICENSE                    -t "$pkgdir"/usr/share/licenses/$pkgname/
}
