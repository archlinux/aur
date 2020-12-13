# Maintainer: Bebbum <bebbumman@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=hound
pkgver=0.3.0
pkgrel=1
pkgdesc='Extremely fast source code search engine'
arch=(i686 x86_64)
license=(MIT)
url='https://github.com/etsy/Hound'
makedepends=(go)
depends=(glibc)
source=($pkgname-$pkgver.zip::https://github.com/hound-search/hound/archive/v$pkgver.zip)
sha512sums=('58aa726e6856f940d3e59d006a7aa95b576ccc31d32df0d826c6466a910ae17db2489de5b683a52259f75a57159870f909d85a2d9141c522cd922246056156ac')

build() {
  cd $pkgname-$pkgver
  make .build/bin/go-bindata
  npm audit fix
  npm install
  make ui/bindata.go
  export GOPATH=`pwd`
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
  install -m 755 -t "$pkgdir/usr/bin" bin/{hound,houndd}
  install -m 644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m 644 -D config-example.json "$pkgdir"/usr/share/$pkgname/config-example.json
}
