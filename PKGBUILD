# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: wyf9661 <wyf9661 at gmail.com>
# Contributor: zhufuyi <g.zhufuyi@gmail.com>

pkgbase="sponge"
pkgname=(
  "${pkgbase}"
  "protoc-gen-go-gin"
  "protoc-gen-go-rpc-tmpl"
  "protoc-gen-json-field"
)
pkgver=1.15.3
pkgrel=1
pkgdesc="Effortlessly build stable, reliable, and high-performance backend services with a \"low-code\" approach"
arch=('x86_64')
url="https://go-sponge.com"
_url="https://github.com/go-dev-frame/${pkgbase}"
license=('MIT')
depends=(
  'glibc'
  'protobuf'
)
makedepends=(
  'go'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0cab423b1ccc993863a387eed2a5f75ef315cab69dba54bc1dcbbcab07094905')

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
  for _name in "${pkgname[@]}"; do
    go build -v -o "build/${_name}" ./"cmd/${_name}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package_sponge() {
  depends+=(
   'protoc-gen-doc'
   'protoc-gen-go'
   "protoc-gen-go-gin=${pkgver}"
   'protoc-gen-go-grpc'
   "protoc-gen-go-rpc-tmpl=${pkgver}"
   'protoc-gen-gotag'
   "protoc-gen-json-field=${pkgver}"
   'protoc-gen-openapiv2'
   'protoc-gen-validate'
   'swag'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_protoc-gen-go-gin() {
  pkgdesc="Protobuf plugin to generate Gin routes, handlers, RPC stubs, and error codes"
  url="${_url}/tree/main/cmd/${pkgname}"
  depends+=(
    'protoc-gen-go'
    'protoc-gen-go-grpc'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "cmd/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_protoc-gen-go-rpc-tmpl() {
  pkgdesc="Protobuf plugin to generate RPC service templates and RPC error codes"
  url="${_url}/tree/main/cmd/${pkgname}"
  depends+=(
    'protoc-gen-go'
    'protoc-gen-go-grpc'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "cmd/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_protoc-gen-json-field() {
  pkgdesc="Protobuf plugin to generate JSON field code from proto files"
  url="${_url}/tree/main/cmd/${pkgname}"

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "cmd/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
