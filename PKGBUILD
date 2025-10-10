# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname=(
  "protoc-gen-grpc-gateway"
  "protoc-gen-openapiv2"
)
pkgbase="grpc-gateway"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-common"
  "${_binname[@]}"
)
pkgver=2.27.3
pkgrel=1
pkgdesc="gRPC to JSON proxy generator following the gRPC HTTP spec"
arch=('aarch64' 'x86_64')
url="https://grpc-ecosystem.github.io/grpc-gateway/"
_url="https://github.com/grpc-ecosystem/${pkgname}"
license=('BSD-3-Clause')
makedepends=(
  'go'
)
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9717bae2d2f783d73f165d57a1f70327abf21629198527b2be09efe43f5ba167')

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
  for _name in "${_binname[@]}"; do
    go build -v -o ./"build/${_name}" ./"${_name}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package_grpc-gateway() {
  pkgdesc+=" (meta)"
  arch=('any')
  depends=(
    "${_binname[@]/%/"=${pkgver}"}"
  )
}

package_grpc-gateway-common() {
  pkgdesc+=" (common files)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

for _name in "${_binname[@]}"; do
  eval "
package_${_name}() {
  depends+=(
    '${pkgbase}-common=${pkgver}'
    'glibc'
    'protobuf'
    'protoc-gen-go'
    'protoc-gen-go-grpc'
  )
  
  cd \"\${srcdir}/${_pkgsrc}\"
  install -vDm755 'build/${_name}' \"\${pkgdir}/usr/bin/${_name}\"
}"
done
