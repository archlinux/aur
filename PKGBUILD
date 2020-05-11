# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ergo
pkgver=0.4.0
pkgrel=1
pkgdesc="List of utilities for the daily developer workflow"
arch=('x86_64')
url='https://github.com/beatlabs/ergo'
license=('BSD')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f9492e454f42e6cfda49fcb7a3397c84096be63d11feab7c8c0bdc4778a450f6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/cli"
  go build -mod=mod -v -o "${srcdir}/ergo-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${srcdir}"/ergo-bin "${pkgdir}/usr/bin/ergo"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ergo/LICENSE"
  go clean -modcache #Remove go libraries
}