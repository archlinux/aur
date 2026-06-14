# Maintainer: Raflos <raflos@gmx.com>
# Previous maintainer:  Alexis Aguilar <aaguilar1892@gmail.com>

pkgname="supabase"
pkgver=2.106.0
pkgrel=1
pkgdesc="CLI for Supabase, an open source Firebase alternative"
arch=('aarch64' 'x86_64')
url="https://supabase.com/docs/reference/cli/about"
_url="https://github.com/${pkgname}/cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
# checkdepends=('docker')
_pkgsrc="cli-${pkgver}"
_pkgdir="${_pkgsrc}/apps/cli-go"
source=("${pkgname}-${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b5c3a0c89840e57ec54e3322446dd718c614229542e5b7e1b7d7ddb24a447db2d521a46af1d968a509d6dbac52d00e8eff064f81f5856c8ebc8740d3f23ad4af')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgdir}"
  go mod download -x
  find "${GOMODCACHE}" -type d -exec chmod 755 {} +
  find "${GOMODCACHE}" -type f -exec chmod 644 {} +

  mkdir -p "build" "completions"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgdir}"
  go build -v -o "build/${pkgname}" -ldflags "\
    -linkmode=external \
    -X ${_url#https://}/internal/utils.Version=${pkgver}" \
    .

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgdir}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "LICENSE"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md"        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "${srcdir}/${_pkgdir}/completions"
  install -vDm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -vDm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${pkgname}/${pkgname}.psm1"
}
