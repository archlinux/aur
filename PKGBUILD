# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-xray-core
pkgver=26.11.9
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
sha256sums=('d5a47bed1b85e1cdfe3cb2f88a02e2db7144f0f8bee541d20b84fafa8fdf6c8d')
b2sums=('db0c4c9ec2e72c088af48731b52f7a88b235f9385aafee19d37d20b65ff9d87574bc135548057c94e0811f160bf91e33be69350710e12544f4aeff5828cb36d6')

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
