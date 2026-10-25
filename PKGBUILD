# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-mtg-multi-core
pkgver=1.16.1
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
sha256sums=('878818ce94707b7fba57ff9d6578d38acdcb2aa7a71f21cbd0f0d6f80a2e825a')
b2sums=('35b949536b7a6a2854b59933d9a851e65f30ca40b53047ffd34f9daa4267f752555a7d39f65af553596bdfa5c709e1760f9b390a445bab958a8f8d1b6b1c17f0')

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
