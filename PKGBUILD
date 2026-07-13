# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui-mtg-multi-core
pkgver=1.15.0
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
sha256sums=('0eb46e8ad42a441c053e60eb4d8e234052fdebc08f9c5bd771c0722237b0cc27')
b2sums=('b469f048775286bd94fa6fe725ba8df5a19b9860ff7e41fc029132d8b5d3892d6d770e756799fcfbcfcfabb4ccb11785b5c5c3e5dfad10110976fa863bfd32b9')

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
