# Maintainer: robinpie <robin413@protonmail.com>
pkgname=dinky
pkgver=0.11.0
pkgrel=1
pkgdesc='A terminal text editor for those who just want to edit some text'
arch=('x86_64')
url='https://github.com/sedwards2009/dinky'
license=('MIT')
conflicts=('dinky-git')
makedepends=('go>=1.24')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aa0e9ad3f23f7b5a85c7da9037980af9dcd9eac99d0d1147ff4658644114f47f')

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
