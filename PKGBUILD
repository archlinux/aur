# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gocard
pkgver=0.3.0
pkgrel=1
pkgdesc="File-based spaced repetition flashcards using Markdown files"
arch=('x86_64' 'aarch64')
url="https://github.com/davidmiserak/gocard"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ffb9b5eff8e8e42a5f96d8e541f4c266cd291535832503ce6d744d8aa43ffb04')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "GoCard-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "GoCard-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/gocard" ./cmd/gocard
}

check() {
  cd "GoCard-${pkgver}"
  _goenv
  go test -short -skip '^TestRenderHorizontalBarChart$' ./...
}

package() {
  cd "GoCard-${pkgver}"
  install -Dm755 "build/gocard" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
