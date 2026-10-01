# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-xray-core
pkgver=26.9.30
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
sha256sums=('85162fa61eb6d1adc9199afff7b41299e69dedd094907e9c56ef665c236b3ef0')
b2sums=('79442febaf31b409812bca75a8e3f4aff3464c6509332753e73944cf68c54a67c1cdd1c66382f0dd714c1e95ebef5a16734e57cd6d155b04db9ca0ae1625f5fc')

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
