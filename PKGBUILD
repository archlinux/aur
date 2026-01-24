# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-xray-core
pkgver=26.1.23
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
sha256sums=('0442d7cbb7de02ef9eac9ad652df66972962473dc7b55441d5abcd032a74b41d')
b2sums=('63f65a696b64d4e9485377a47d148473ab7e66879a6427554d0997cf11e48d47ff2f427ef19cf90a47e2d02b025133332f54d362715a044aad665d7780dd74f6')

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
