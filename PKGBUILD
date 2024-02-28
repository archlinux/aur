# Maintainer:
# Contributor: syui <syui@users.noreply.github.com>

pkgname=twg
pkgver=0.4.8
pkgrel=1
pkgdesc="twitter client for CLI"
arch=('x86_64')
url="https://github.com/syui/twg"
options=('!strip' '!emptydirs')
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5f60a8685c671d1cd0bb1996d56e7ec5f63c8c56dcb91cf6541fe709711d04eb')

build() {
  cd $pkgname-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # Please put Twitter Keys here. See documentation
  # https://github.com/syui/twg?tab=readme-ov-file#build
  export CKEY="putconsumerkeyhere"
  export CSKEY="putsecretkeyhere"

  go mod tidy
  go build -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X github.com/syui/twg/oauth.ckey=$CKEY -X github.com/syui/twg/oauth.cskey=$CSKEY"
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  # license file is missing
}

# vim:set ts=2 sw=2 et:
