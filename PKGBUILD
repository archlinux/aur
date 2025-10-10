# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname=(
  "protoc-gen-grpc-gateway"
  "protoc-gen-openapiv2"
)
_pkgbase="grpc-gateway"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase}-common"
  "${_binname[@]}"
)
pkgbase="${_pkgbase}-git"
pkgname=(
  "${_pkgname[@]/%/-git}"
)
pkgver=2.27.3.r31.gabd001a
pkgrel=2
pkgdesc="gRPC to JSON proxy generator following the gRPC HTTP spec"
arch=('aarch64' 'x86_64')
url="https://grpc-ecosystem.github.io/grpc-gateway/"
_url="https://github.com/grpc-ecosystem/${_pkgbase}"
license=('BSD-3-Clause')
makedepends=(
  'git'
  'go'
)
_pkgsrc="${_pkgname}"
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
  for _name in "${_binname[@]}"; do
    go build -v -o ./"build/${_name}" ./"${_name}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package_grpc-gateway-git() {
  pkgdesc+=" (meta)"
  arch=('any')
  depends=(
    "${_binname[@]/%/"-git=${pkgver}-${pkgrel}"}"
  )
  provides=(
    "${pkgname%-git}=${pkgver%%.r*}"
  )
  conflicts=(
    "${pkgname%-git}"
  )
}

package_grpc-gateway-common-git() {
  pkgdesc+=" (common files)"
  arch=('any')
  provides=(
    "${pkgname%-git}=${pkgver%%.r*}"
  )
  conflicts=(
    "${pkgname%-git}"
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

for _name in "${_binname[@]}"; do
  eval "
package_${_name}-git() {
  depends+=(
    '${_pkgbase}-common-git=${pkgver}-${pkgrel}'
    'glibc'
    'protobuf'
    'protoc-gen-go'
    'protoc-gen-go-grpc'
  )
  provides=(
    '${_name}=${pkgver%%.r*}'
  )
  conflicts=(
    '${_name}'
  )
  
  cd \"\${srcdir}/${_pkgsrc}\"
  install -vDm755 'build/${_name}' \"\${pkgdir}/usr/bin/${_name}\"
}"
done
