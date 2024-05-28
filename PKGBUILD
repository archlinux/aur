# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>

pkgname=clockify-cli
pkgver=0.50.1
pkgrel=1
pkgdesc='A simple cli to manage your time entries on Clockify from terminal'
arch=('x86_64')
url='https://clockify-cli.netlify.app'
license=('Apache-2.0')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}::git+https://github.com/lucassabreu/clockify-cli#tag=v${pkgver}")
sha256sums=('dabb61290027fdf900cb0d1ebd956e351f6cbb3bc68f0dbc5fbc8b1c57e0e50d')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"
  go build -o build ./cmd/clockify-cli
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/clockify-cli "${pkgdir}/usr/bin/clockify-cli"
}
