# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go-vtproto"
pkgname="${_pkgname}-git"
pkgver=0.6.0.r27.gba97887
pkgrel=1
pkgdesc="Protocol Buffers compiler that generates optimized marshaling & unmarshaling Go code for ProtoBuf APIv2"
arch=('x86_64')
url="https://github.com/planetscale/vtprotobuf"
license=('BSD-3-Clause')
depends=(
  'glibc'
  'protobuf'
  'protoc-gen-go'
  'protoc-gen-go-grpc'
)
makedepends=(
  'git'
  'go'
)
provides=(
  "${_pkgname}=${pkgver%%.r*}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -x
  chmod -R ug+Xwr "${GOMODCACHE}"

  mkdir -p "build"
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  go build -v -o "build/${_pkgname}" ./"cmd/${_pkgname}"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
