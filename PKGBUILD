# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-mtg-multi-core
pkgver=1.16.0
pkgrel=1
pkgdesc="Highly opinionated MTPROTO proxy for Telegram. Supports accounts (for *x-ui)"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/MHSanaei/mtg-multi"
license=(MIT)
depends=(glibc)
makedepends=(go)
provides=(x-ui-mtg-core x-ui-mtg-multi-core)
conflicts=(x-ui-mtg-core x-ui-mtg-multi-core)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('265c723d1c8cdccd5d43c826505a4aa5b22ffe0462f35322665594991fb9482f')
b2sums=('92079472f58b8eab625ebee7088b3860fa675cfcb22f27e5639b004ab27930c6b42f29608d5ecf3cb7ae5edc25a58092c207d74c926f4f2a57dbaa70fee3089c')

build() {
  cd mtg-multi-$pkgver
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
  cd mtg-multi-$pkgver
  case ${CARCH} in
    aarch64) _mtgarch="arm64";;
    armv7h)  _mtgyarch="arm32";;
    i686)    _mtgarch="i386";;
    x86_64)  _mtgarch="amd64";;
  esac
  install -vDm 755 build/$pkgname    "$pkgdir"/usr/lib/x-ui/bin/mtg-linux-${_mtgarch}
  install -vDm 644 LICENSE        -t "$pkgdir"/usr/share/licenses/$pkgname
}
