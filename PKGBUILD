# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=moji
pkgver=0.8.1
pkgrel=1
pkgdesc="Find and download fonts from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/microck/moji"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3b7803cbcf00048394668746a847074ce76928850199bb38fdd809042268a4c9')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "moji-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "moji-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/moji" ./cmd/moji
}

check() {
  cd "moji-${pkgver}"
  _goenv
  go test -short ./...
}

package() {
  cd "moji-${pkgver}"
  install -Dm755 "build/moji" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
