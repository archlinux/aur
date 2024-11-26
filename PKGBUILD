# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="flow"
pkgname="${_binname}-cli"
pkgver=2.2.0
pkgrel=1
pkgdesc="A command-line interface that provides useful utilities for building Flow applications"
arch=('x86_64' 'aarch64')
url="https://docs.onflow.org/flow-cli"
_url="https://github.com/onflow/${pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c692353e36f8405dc6e0712fcde6467b6394c2b73d5f6c43074dab577e39568c1047618be00a9b06d2ad8788108626c390970f239780e6e934f80beef786c53f')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${_binname}" -ldflags "\
    -X ${_url#https://}/build.semver=${pkgver} \
    -X ${_url#https://}/internal/command.mixpanelToken=$(grep -E '^MIXPANEL_PROJECT_TOKEN :=' Makefile | sed 's/.*= //') \
    -X ${_url#https://}/internal/accounts.accountToken=$(grep -E '^ACCOUNT_TOKEN :=' Makefile | sed 's/.*= //')" \
    ./"cmd/${_binname}"

  for _sh in bash fish zsh powershell; do
    ./"build/${_binname}" completion "${_sh}" > "completions/${_binname}.${_sh}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_binname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -vDm644 "${_binname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
  install -vDm644 "${_binname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -vDm644 "${_binname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_binname}/${_binname}.ps1"
}
