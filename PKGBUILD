# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dashbrew
pkgver=1.2.0
pkgrel=1
pkgdesc="TUI dashboard builder for data from scripts and APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/rasjonell/dashbrew"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bcc7943a105229b22efee97c291ee1b4a6fbae0b7637c90f7526ae8395c2e89d')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "dashbrew-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "dashbrew-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/dashbrew" ./cmd/dashbrew
}

check() {
  cd "dashbrew-${pkgver}"
  _goenv
  go test -short ./...
}

package() {
  cd "dashbrew-${pkgver}"
  install -Dm755 "build/dashbrew" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
