# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=go-mmproxy
pkgver=2.3.1
pkgrel=1
pkgdesc="Faster and stable implementation of mmproxy"
arch=(aarch64 x86_64)
url="https://github.com/kzemek/$pkgname"
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(go)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('c7c9e18adff4253957e292baf8ae664bd9fc9958268aa2e83a73522c51b34813ea43277a4a0c15386fff20abd84de4e0f4cd5c2f58928e248d15e8b15b624756')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|DynamicUser=yes|User=root|'                           examples/$pkgname.service
  sed -i 's|:1000|:22|g'                                          examples/$pkgname.service
  sed -i 's| -allowed-subnets /etc/go-mmproxy/net-prefixes.txt||' examples/$pkgname.service
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
  install -vDm 755 build/$pkgname            -t "$pkgdir"/usr/bin/
  install -vDm 644 examples/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm 644 LICENSE                   -t "$pkgdir"/usr/share/licenses/$pkgname/
}
