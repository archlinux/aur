# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgbase="kratos"
_pkgname=(
  "${_pkgbase}"
  "protoc-gen-go-errors"
  "protoc-gen-go-http"
)
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgname[@]/%/-git}")
pkgver=2.8.4.r35.g308cfee
pkgrel=2
pkgdesc="Your ultimate Go microservices framework for the cloud-native era"
arch=('x86_64')
url="https://go-kratos.dev"
_url="https://github.com/go-kratos/${_pkgbase}"
license=('MIT')
depends=(
  'glibc'
  'protobuf'
  'protoc-gen-go'
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
  for _name in "${_pkgname[@]}"; do
    pushd "cmd/${_name}" >/dev/null
    go mod download -x
    popd >/dev/null
  done
  chmod -R ug+Xwr "${GOMODCACHE}"

  mkdir -p "build" "completions"
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
    pushd "cmd/${_name}" >/dev/null
    go build -v -o "${srcdir}/${_pkgsrc}/build/${_name}" .
    popd >/dev/null
  done

  for _sh in bash fish zsh powershell; do
    ./"build/${_pkgbase}" completion "${_sh}" > "completions/${_pkgbase}.${_sh}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  for _name in "${_pkgname[@]}"; do
    pushd "cmd/${_name}" >/dev/null
    go test ./...
    popd >/dev/null
  done
}

package_kratos-git() {
  depends+=(
   'protoc-gen-go-grpc'
   "protoc-gen-go-errors-git=${pkgver}"
   "protoc-gen-go-http-git=${pkgver}"
   "protoc-gen-validate"
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

  cd "completions"
  install -vDm644 "${pkgname%-git}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"
  install -vDm644 "${pkgname%-git}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname%-git}.fish"
  install -vDm644 "${pkgname%-git}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-git}"
  install -vDm644 "${pkgname%-git}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname%-git}.ps1"
}

package_protoc-gen-go-errors-git() {
  pkgdesc="Protobuf plugin that generates error codes and RPC error helpers"
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
}

package_protoc-gen-go-http-git() {
  pkgdesc="Protobuf plugin that generates RPC service templates for HTTP APIs"
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
}
