# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name=("protoc-gen-grpc-gateway" "protoc-gen-openapiv2")
pkgname="grpc-gateway"
pkgver=2.27.2
pkgrel=1
pkgdesc="gRPC to JSON proxy generator following the gRPC HTTP spec"
arch=('aarch64' 'x86_64')
url="https://grpc-ecosystem.github.io/grpc-gateway/"
_url="https://github.com/grpc-ecosystem/${pkgname}"
license=('BSD-3-Clause')
depends=('glibc' 'protobuf' 'protoc-gen-go' 'protoc-gen-go-grpc')
makedepends=('go')
provides=("${_name[@]}")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('510990df237b7adb934383c21e351003012d54ee34b84b10a2b26a359a0a1ba8')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -x
  chmod -R ug+Xwr "${GOMODCACHE}"

  mkdir -p "build"
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
  for _binary in "${_name[@]}"; do
    go build -v -o ./"build/${_binary}" ./"${_binary}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  for _binary in "${_name[@]}"; do
    install -vDm755 "build/${_binary}" "${pkgdir}/usr/bin/${_binary}"
  done

  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
