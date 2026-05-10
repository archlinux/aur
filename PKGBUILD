# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-xray-core
pkgver=26.5.9
pkgrel=1
pkgdesc="Xray, Penetrates Everything. Also the best v2ray-core (for *x-ui)"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/XTLS/Xray-core"
license=(MPL-2.0)
depends=(glibc)
makedepends=(go)
provides=(x-ui-xray-core)
conflicts=(x-ui-xray-core)
options=(!debug)
install=$pkgname.install
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('2cbd37f70b246d93aa4f1f5d4261cf2e622ff78ca71a7f7a4271aa517e749025')
b2sums=('0f4dd82c998ce58acfa72f56b33714287b24aa45d00a1c7f96630bbc1d3fa44c15a7da02199f9420655f789e06987dd48b0df44fed84cba9ae73804a1b58183f')

build() {
  cd Xray-core-$pkgver
  export GOCACHE="$srcdir"/go-build
  export GOPATH="$srcdir"/go
  export CGO_CPPFLAGS=$CPPFLAGS
  export CGO_CFLAGS=$CFLAGS
  export CGO_CXXFLAGS=$CXXFLAGS
  export CGO_LDFLAGS=$LDFLAGS
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false"
  go build -v -o build/$pkgname -ldflags="-linkmode=external -s -w -buildid= -extldflags=-Wl,-z,relro,-z,now" ./main
}

package() {
  cd Xray-core-$pkgver
  case ${CARCH} in
    aarch64) _xrayarch="arm64";;
    armv7h)  _xrayarch="arm32";;
    i686)    _xrayarch="i386";;
    x86_64)  _xrayarch="amd64";;
  esac
  install -vDm 755 build/$pkgname    "$pkgdir"/usr/lib/x-ui/bin/xray-linux-${_xrayarch}
  install -vDm 644 LICENSE        -t "$pkgdir"/usr/share/licenses/$pkgname
}
