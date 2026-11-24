# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=stock-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="Real-time stock and cryptocurrency tracker for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ni5arga/stock-tui"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a6b1d74d2534613ede6230c0a2f23d05cdb5b07b597618307b98ef074d471762')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "stock-tui-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "stock-tui-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/stock-tui" ./cmd/stock-tui
}

check() {
  cd "stock-tui-${pkgver}"
  _goenv
  go test -short ./...
}

package() {
  cd "stock-tui-${pkgver}"
  install -Dm755 "build/stock-tui" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
