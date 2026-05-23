# Maintainer: robinpie <robin413@protonmail.com>
pkgname=dinky
pkgver=0.10.0
pkgrel=1
pkgdesc='A terminal text editor for those who just want to edit some text'
arch=('x86_64')
url='https://github.com/sedwards2009/dinky'
license=('MIT')
conflicts=('dinky-git')
makedepends=('go>=1.24')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d4529dbdcc927f25e6197dbad2a1964bfe186671631bf6ebef8ece8371644512')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"

  go build -v -o dinky .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 dinky "${pkgdir}/usr/bin/dinky"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
