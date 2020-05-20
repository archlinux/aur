# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=revive
pkgver=1.0.2
pkgrel=1
pkgdesc="~6x faster, stricter, configurable, extensible, and beautiful drop-in replacement for golint"
arch=('x86_64')
url='https://revive.run'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mgechev/revive/archive/v${pkgver}.tar.gz")
sha256sums=('1d3b7a171afba55ee5a6cd7c87ebbcb452ec78a6cf0543584fada7d725ffca31')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/revive "${pkgdir}/usr/bin/revive"
  install -Dm644 defaults.toml "${pkgdir}/etc/revive/revive.toml"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}