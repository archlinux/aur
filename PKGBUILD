# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="flow"
pkgname="${_binname}-cli"
pkgver=2.0.5
pkgrel=1
pkgdesc="A command-line interface that provides useful utilities for building Flow applications"
arch=('x86_64')
url="https://docs.onflow.org/flow-cli"
_url="https://github.com/onflow/${pkgname}"
license=('Apache-2.0')
makedepends=('go')
depends=('glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0bd192d70d534a764d9cf4dafed2195be1f5f215a9da1ceaca438942c5dc5d642743d06151f8a3b0104fd00f27fe352c40b91ee88b966a377854474e4648d35d')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
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
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
