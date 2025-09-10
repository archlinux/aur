# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-xray-core
pkgver=25.9.10
pkgrel=1
pkgdesc="Xray, Penetrates Everything. Also the best v2ray-core (for 3x-ui)"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/XTLS/Xray-core"
license=(MPL-2.0)
depends=(glibc)
makedepends=(go)
provides=(v2ray)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c26b1e3533540f63acb641cea9af660fae60bd50b6ee4a9904858a073161f3dd')
b2sums=('4b4c6e76009f09ac12376a8bd338d4fba82eb85b48266685463500b6db9ae04c16c6c7113e3996d3798e14a1492ebdec394f851535b0adae630c975307255ea1')

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
