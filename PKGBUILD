# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reflex
pkgver=0.2.0
pkgrel=1
pkgdesc="Run a command when files change"
arch=('x86_64')
url='https://github.com/cespare/reflex'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cespare/reflex/archive/v${pkgver}.tar.gz")
sha256sums=('528ef2a0160528d8514f86ce0353497ade0219017a6407e4c08878264b87d4a4')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go get -d -v ./...
  go build -o build ./...
  go clean -modcache # Clean go cache
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}