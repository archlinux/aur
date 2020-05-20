# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ergo
pkgver=0.4.0
pkgrel=1
pkgdesc="List of utilities for the daily developer workflow"
arch=('x86_64')
url='https://github.com/beatlabs/ergo'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f9492e454f42e6cfda49fcb7a3397c84096be63d11feab7c8c0bdc4778a450f6')

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
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/cli "${pkgdir}/usr/bin/ergo"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ergo/LICENSE"
}