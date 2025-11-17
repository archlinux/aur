# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="kratos"
pkgname=(
  "${pkgbase}"
  "protoc-gen-go-errors"
  "protoc-gen-go-http"
)
pkgver=2.9.1
pkgrel=1
pkgdesc="Your ultimate Go microservices framework for the cloud-native era"
arch=('x86_64')
url="https://go-kratos.dev"
_url="https://github.com/go-kratos/${pkgbase}"
license=('MIT')
makedepends=(
  'go'
)
checkdepends=(
  'git'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6bd9f0c3cec292143452f02f476314939e2a939b3c8db2a3597a7ef44be272bb')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  for _name in "${pkgname[@]}"; do
    pushd "cmd/${_name}" >/dev/null
    go mod download -modcacherw -x
    popd >/dev/null
  done

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
    'glibc'
    'go'
    'protobuf'
    'protoc-gen-go'
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
  url+="/tree/main/cmd/${pkgname}"
  depends=(
    'glibc'
    'protobuf'
    'protoc-gen-go'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_protoc-gen-go-http() {
  pkgdesc="Protobuf plugin that generates RPC service templates for HTTP APIs"
  url+="/tree/main/cmd/${pkgname}"
  depends=(
    'glibc'
    'protobuf'
    'protoc-gen-go'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
