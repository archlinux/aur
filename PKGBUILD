# Maintainer: Hao Long <aur@esd.cc>

pkgname=terminal-to-html
pkgver=3.8.0
pkgrel=1
pkgdesc="Converts arbitrary shell output (with ANSI) into beautifully rendered HTML"
arch=("x86_64" "i686")
url="https://github.com/buildkite/terminal-to-html"
license=('MIT')
provides=('terminal-to-html')
conflicts=('terminal-to-html')
depends=('glibc')
makedepends=('go' 'go-bindata')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('20057698733fed48936c76b637097e63e3f8cb067679f8c473a5f7815d5a57dcc6b765eaf219a213960c609cf444ed43723c4dab0471e0c745da627e559663d3')

build() {
  cd ${pkgname}-${pkgver}
  go-bindata -o ./cmd/bindata.go assets/
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/${pkgname}
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
