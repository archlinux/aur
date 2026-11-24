# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cclog
pkgver=0.7.4
pkgrel=1
pkgdesc="Convert Claude Code conversations to Markdown, with a TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/annenpolka/cclog"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6cdd2ccdc28eb4dd8ac446d29d914657bf5600b99bf7b70959becb6181c2b247')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "cclog-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "cclog-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/cclog" ./cmd/cclog
}

package() {
  cd "cclog-${pkgver}"
  install -Dm755 "build/cclog" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
