# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_modules=(
  "protoc-gen-grpc-api-gateway"
  "protoc-gen-openapiv3"
)
pkgbase="grpc-api-gateway"
pkgname=(
  "${pkgbase}-common"
  "${_modules[@]}"
)
pkgver=0.1.0
pkgrel=1
pkgdesc="Flexible and fast gRPC to HTTP and OpenAPI interface"
arch=('aarch64' 'i686' 'x86_64')
url="https://meshapi.github.io/grpc-api-gateway/"
_url="https://github.com/meshapi/${pkgbase}"
license=('GPL-3.0-only')
makedepends=(
  'go'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b23075cfa625b8b2906f6e367b30f957b043fe9c78b8cf81db8a27316d92ab6f')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}/codegen"
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

  cd "${srcdir}/${_pkgsrc}/codegen"
  for _module in "${_modules[@]}"; do
    go build -v -o "build/${_module}" ./"cmd/${_module}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}/codegen"
  go test ./...
}

package_grpc-api-gateway-common() {
  pkgdesc+=" (common files)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_protoc-gen-grpc-api-gateway() {
  depends+=(
    "${pkgbase}-common=${pkgver}"
    'glibc'
    'protobuf'
  )

  cd "${srcdir}/${_pkgsrc}/codegen"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -vd "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"
  ln -vsf "/usr/share/doc/${pkgbase}" "${pkgdir}/usr/share/doc/${pkgname}"
  ln -vsf "/usr/share/licenses/${pkgbase}" "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_protoc-gen-openapiv3() {
  depends+=(
    "${pkgbase}-common=${pkgver}"
    'glibc'
    'protobuf'
  )

  cd "${srcdir}/${_pkgsrc}/codegen"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -vd "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"
  ln -vsf "/usr/share/doc/${pkgbase}" "${pkgdir}/usr/share/doc/${pkgname}"
  ln -vsf "/usr/share/licenses/${pkgbase}" "${pkgdir}/usr/share/licenses/${pkgname}"
}
