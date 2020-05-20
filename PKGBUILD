# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mole
pkgver=0.5.0
pkgrel=2
pkgdesc="CLI app to create SSH tunnels"
arch=('x86_64')
url='https://davrodpin.github.io/mole'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davrodpin/mole/archive/v${pkgver}.tar.gz")
sha256sums=('58cff1a00510eb677e0bf929393f9697e71ea25e3c8a84290e4a75d3b91f7648')

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
  install -Dm755 build/mole "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}