# Maintainer: Raphael Nestler (rnestler) <raphael.nestler@gmail.com>

_pkgname=redmine-cli
pkgname="${_pkgname}-go"
pkgver=0.1.7
pkgrel=1
pkgdesc="A CLI tool to interact with the Redmine project management system."
arch=('x86_64')
url="https://github.com/MrJeffLarry/redmine-cli"
license=('MIT')
makedepends=('go')

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/MrJeffLarry/redmine-cli/archive/v${pkgver}.tar.gz")
sha256sums=('eaf4163944310ee2a065ab4bf0b742c363aee9ccb122a370a3a8c23642a61880')

prepare() {
  cd "$_pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-s -w -X main.version=${pkgver}-arch" -o build/red-cli ./cmd/red/
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 build/red-cli "$pkgdir"/usr/bin/red-cli
}
