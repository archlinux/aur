# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>

pkgname=clockify-cli
pkgver=0.49.0
pkgrel=1
pkgdesc='A simple cli to manage your time entries on Clockify from terminal'
arch=('x86_64')
url='https://clockify-cli.netlify.app'
license=('Apache-2.0')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}::git+https://github.com/lucassabreu/clockify-cli#tag=v${pkgver}")
sha256sums=('98b03480f99f0984e6da98badd89b366f808eaca18a9d5985e10e6ba898e1c70')

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
