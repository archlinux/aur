# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=c2go
pkgver=0.26.11
pkgrel=1
pkgdesc="A tool for transpiling C to Go"
arch=('x86_64')
url='https://github.com/elliotchance/c2go'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e6443aa41fe5605c38a54d39d844d6c5cbb1270162aaecfb692f563bc60f1c6f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build/
  go mod download
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external"
  go build -v -o build ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/c2go -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/c2go/"
}
