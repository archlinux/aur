# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="kratos"
pkgname=(
  "${pkgbase}"
  "protoc-gen-go-errors"
  "protoc-gen-go-http"
)
pkgver=2.8.4
pkgrel=2
pkgdesc="Your ultimate Go microservices framework for the cloud-native era"
arch=('x86_64')
url="https://go-kratos.dev"
_url="https://github.com/go-kratos/${pkgbase}"
license=('MIT')
depends=(
  'glibc'
  'protobuf'
  'protoc-gen-go'
)
makedepends=(
  'go'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('18e5204346a742e34c4d9f1f995d30fca7cbde0d8eb466533bd8f18652d6e859')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  for _name in "${pkgname[@]}"; do
    pushd "cmd/${_name}" >/dev/null
    go mod download -x
    popd >/dev/null
  done
  chmod -R ug+Xwr "${GOMODCACHE}"

  mkdir -p "build" "completions"
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
    pushd "cmd/${_name}" >/dev/null
    go build -v -o "${srcdir}/${_pkgsrc}/build/${_name}" .
    popd >/dev/null
  done

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgbase}" completion "${_sh}" > "completions/${pkgbase}.${_sh}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  for _name in "${pkgname[@]}"; do
    pushd "cmd/${_name}" >/dev/null
    go test ./...
    popd >/dev/null
  done
}

package_kratos() {
  depends+=(
   'protoc-gen-go-grpc'
   "protoc-gen-go-errors=${pkgver}"
   "protoc-gen-go-http=${pkgver}"
   "protoc-gen-validate"
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -vDm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
}

package_protoc-gen-go-errors() {
  pkgdesc="Protobuf plugin that generates error codes and RPC error helpers"
  url="${_url}/tree/main/cmd/${pkgname}"

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_protoc-gen-go-http() {
  pkgdesc="Protobuf plugin that generates RPC service templates for HTTP APIs"
  url="${_url}/tree/main/cmd/${pkgname}"

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
