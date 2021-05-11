# Maintainer: Bebbum <bebbumman@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=hound
pkgver=0.4.0
pkgrel=1
pkgdesc='Extremely fast source code search engine'
arch=(i686 x86_64)
license=(MIT)
url='https://github.com/etsy/Hound'
makedepends=(go)
depends=(glibc)
source=($pkgname-$pkgver.zip::https://github.com/hound-search/hound/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('5f72d63269f6ed548abe36a9736a72eadaf8e5149f8190648bfe9f64367084252e4f509321622e4f2ceb14baf03872a7db339aab75266c2d5a40577ab1fbd427')

build() {
  cd $pkgname-$pkgver
  make .build/bin/go-bindata
  npm update
  npm audit fix
  npm install
  make ui/bindata.go
  export GOPATH=`pwd`/.build/
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external"
  go get github.com/hound-search/hound/cmds/houndd
  go install github.com/hound-search/hound/cmds/houndd
  go get github.com/hound-search/hound/cmds/hound
  go install github.com/hound-search/hound/cmds/hound
}

check() {
  cd $pkgname-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external"
  go test github.com/hound-search/hound/...
}

package() {
  cd $pkgname-$pkgver
  install -m 755 -d "$pkgdir/usr/bin"
  install -m 755 -t "$pkgdir/usr/bin" .build/bin/{hound,houndd}
  install -m 644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m 644 -D config-example.json "$pkgdir"/usr/share/$pkgname/config-example.json
}
