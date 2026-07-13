# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-mtg-core
pkgver=2.2.8
pkgrel=2
pkgdesc="Highly opinionated MTPROTO proxy for Telegram (for *x-ui)"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/9seconds/mtg"
license=(MIT)
depends=(glibc)
makedepends=(go)
provides=(x-ui-mtg-core)
conflicts=(x-ui-mtg-core)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('7808d81f91c44fed8e40ffbfd63dabc5461e551bd9783f0cd6af3f923ee1aee2')
b2sums=('13760e35336a56cb5fb1b1524adc3c741419a247804476db79c482b4fcd5501336f7a107d012c6d45e917ac9465d9eb75a162532a8f296a9fc571ad01606c622')

build() {
  cd mtg-$pkgver
  export GOCACHE="$srcdir"/go-build
  export GOPATH="$srcdir"/go
  export CGO_CPPFLAGS=$CPPFLAGS
  export CGO_CFLAGS=$CFLAGS
  export CGO_CXXFLAGS=$CXXFLAGS
  export CGO_LDFLAGS=$LDFLAGS
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false -tags=netgo"
  go build -v -o build/$pkgname -ldflags="-linkmode=external -s -w -buildid= -X 'main.version=$pkgver'"
}

package() {
  cd mtg-$pkgver
  case ${CARCH} in
    aarch64) _mtgarch="arm64";;
    armv7h)  _mtgarch="arm32";;
    i686)    _mtgarch="i386";;
    x86_64)  _mtgarch="amd64";;
  esac
  install -vDm 755 build/$pkgname    "$pkgdir"/usr/lib/x-ui/bin/mtg-linux-${_mtgarch}
  install -vDm 644 LICENSE        -t "$pkgdir"/usr/share/licenses/$pkgname
}
