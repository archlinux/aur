# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: wyf9661 <wyf9661 at gmail.com>
# Contributor: zhufuyi <g.zhufuyi@gmail.com>

_pkgbase="sponge"
_pkgname=(
  "${_pkgbase}"
  "protoc-gen-go-gin"
  "protoc-gen-go-rpc-tmpl"
  "protoc-gen-json-field"
)
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgname[@]/%/-git}")
pkgver=1.14.6.r0.ge03df22
pkgrel=1
pkgdesc="Effortlessly build stable, reliable, and high-performance backend services with a \"low-code\" approach"
arch=('x86_64')
url="https://go-sponge.com"
_url="https://github.com/go-dev-frame/${_pkgbase}"
license=('MIT')
depends=(
  'glibc'
  'protobuf'
)
makedepends=(
  'git'
  'go'
)
_pkgsrc="${_url##*/}"
source=("${_pkgsrc}::git+${_url}.git")
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
  for _name in "${_pkgname[@]}"; do
    go build -v -o "build/${_name}" ./"cmd/${_name}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package_sponge-git() {
  depends+=(
   'protoc-gen-doc'
   'protoc-gen-go'
   "protoc-gen-go-gin-git=${pkgver}"
   'protoc-gen-go-grpc'
   "protoc-gen-go-rpc-tmpl-git=${pkgver}"
   'protoc-gen-gotag'
   "protoc-gen-json-field-git=${pkgver}"
   'protoc-gen-openapiv2'
   'protoc-gen-validate'
   'swag'
  )
  provides=(
    "${pkgname%-git}=${pkgver%%.r*}"
  )
  conflicts=(
    "${pkgname%-git}"
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

package_protoc-gen-go-gin-git() {
  pkgdesc="Protobuf plugin to generate Gin routes, handlers, RPC stubs, and error codes"
  url="${_url}/tree/main/cmd/${pkgname%-git}"
  depends+=(
    'protoc-gen-go'
    'protoc-gen-go-grpc'
  )
  provides=(
    "${pkgname%-git}=${pkgver%%.r*}"
  )
  conflicts=(
    "${pkgname%-git}"
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

  cd "cmd/${pkgname%-git}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}

package_protoc-gen-go-rpc-tmpl-git() {
  pkgdesc="Protobuf plugin to generate RPC service templates and RPC error codes"
  url="${_url}/tree/main/cmd/${pkgname%-git}"
  depends+=(
    'protoc-gen-go'
    'protoc-gen-go-grpc'
  )
  provides=(
    "${pkgname%-git}=${pkgver%%.r*}"
  )
  conflicts=(
    "${pkgname%-git}"
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

  cd "cmd/${pkgname%-git}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}

package_protoc-gen-json-field-git() {
  pkgdesc="Protobuf plugin to generate JSON field code from proto files"
  url="${_url}/tree/main/cmd/${pkgname%-git}"
  provides=(
    "${pkgname%-git}=${pkgver%%.r*}"
  )
  conflicts=(
    "${pkgname%-git}"
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

  cd "cmd/${pkgname%-git}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
