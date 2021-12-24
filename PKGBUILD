# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reflex
pkgver=0.3.1
pkgrel=1
pkgdesc="Run a command when files change"
arch=('x86_64')
url='https://github.com/cespare/reflex'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cespare/reflex/archive/v${pkgver}.tar.gz")
sha256sums=('efe3dc7bc64b5a978c6e7f790e3d210aed16bd7e43c7fbc2713fe4b16a7a183e')

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
  install -Dm755 build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
