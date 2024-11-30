# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="algolia"
pkgver=1.6.11
pkgrel=3
pkgdesc="Interact with and configure Algolia applications"
arch=('x86_64' 'aarch64' 'i686' 'armv6h')
url="https://www.algolia.com/doc/tools/cli"
_url="https://github.com/algolia/cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
_pkgsrc="cli-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0965dadab1519128130532141701efbf56310f7cb9735c1da596cf6f2aad4657')

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
  go build -v -o "build/${pkgname}" -ldflags "\
    -X ${_url#https://}/pkg/version.Version=${pkgver}" \
    ./"cmd/${pkgname}"

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
