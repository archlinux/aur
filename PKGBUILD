# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="protoc-gen-go-ttrpc"
pkgver=1.2.9
pkgrel=1
pkgdesc="GRPC for low-memory environments"
arch=(
  'x86_64'
)
url="https://github.com/containerd/ttrpc"
license=(
  'Apache-2.0'
)
depends=(
  'glibc'
  'protobuf'
  'protoc-gen-go'
)
makedepends=(
  'go'
)
conflicts=(
  "ttrpc-common<=1.2.8-1"
)
replaces=(
  "ttrpc-common<=1.2.8-1"
  "protoc-gen-gogottrpc<=1.2.8-1"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('16dba7a04c7eb11bc0f725d5ffaa8863d60113b711a1caacf7c99a543ac3960f')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
  go mod verify
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}"
  go build -v -o "build/${pkgname}" ./"cmd/${pkgname}"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
