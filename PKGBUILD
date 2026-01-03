# Maintainer: Tuan Anh Tran <me at tuananh dot org>

pkgname=ops
pkgver=0.1.45
pkgrel=1
pkgdesc="Build and run nanos unikernels"
arch=('x86_64')
url='https://ops.city'
license=('MIT')
depends=('glibc')
optdepends=('qemu')
makedepends=(
    'go'
    'buf'
    'protoc-gen-go-grpc'
    'protoc-gen-go'
    'protoc-gen-grpc-gateway'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nanovms/ops/archive/${pkgver}.tar.gz")
sha256sums=('a657ee753559c5598cf3e952460fc164f9344a81476a02bc20c8ca18bccb042c')

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

  make deps
  make generate
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-X github.com/nanovms/ops/lepton.Version=${pkgver}" \
    -o build ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/ops "${pkgdir}/usr/bin/ops"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ops/LICENSE"
}
