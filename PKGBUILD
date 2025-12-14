# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>

pkgname=clockify-cli
pkgver=0.58.0
pkgrel=1
pkgdesc='A simple cli to manage your time entries on Clockify from terminal'
arch=('x86_64')
url='https://clockify-cli.netlify.app'
license=('Apache-2.0')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}::git+https://github.com/lucassabreu/clockify-cli#tag=v${pkgver}")
sha256sums=('03708332ae04a9d7bdd50675bc95ac6fc76a68d0c870956da383303c046cf1bc')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build

  commit="$(git rev-parse "v${pkgver}")"
  build_date="$(date -u "+%Y-%m-%dT%H:%M:%SZ")"

  sed -i \
    -e "s/^\(\s*version\s*=\s*\"\)dev\(\".*$\)/\1${pkgver}\2/" \
    -e "s/^\(\s*commit\s*=\s*\"\)none\(\".*$\)/\1${commit}\2/" \
    -e "s/^\(\s*date\s*=\s*\"\)unknown\(\".*$\)/\1${build_date}\2/" \
    cmd/clockify-cli/main.go
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
