# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=yoyo-tui
pkgver=0.8.0
pkgrel=1
pkgdesc="TUI command launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/leolorenzato/yoyo"
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=('yoyo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('de1472caf734b92acc80e3d5f18090f7b98d1eb795631d3da3de4a44cab3b0c7')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "yoyo-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "yoyo-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/yoyo" ./cmd/app
}

check() {
  cd "yoyo-${pkgver}"
  _goenv
  go test -short ./...
}

package() {
  cd "yoyo-${pkgver}"
  install -Dm755 "build/yoyo" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
