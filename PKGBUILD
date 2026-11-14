# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=gopodder
pkgver=1.4.3
pkgrel=2
pkgdesc='gPodder-compatible podcast synchronization server'
arch=('x86_64' 'aarch64')
url='https://github.com/cbrgm/gopodder'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
install=gopodder.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'gopodder.service')
sha256sums=('b636a49049beffb7a6ae0e03f5c5585547b375fe970e3adec4d1310e3e9727e7'
            '510a4591d5688bf07ef4f491175413e2ce381cee63a43e6b02ffbb2b1e194ece')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false"
  go build -o build -ldflags "-linkmode=external -X main.Version=${pkgver}" ./cmd/...
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 "${srcdir}"/gopodder.service "${pkgdir}"/usr/lib/systemd/system/gopodder.service
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
