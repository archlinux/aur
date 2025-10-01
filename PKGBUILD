# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="hishtory"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-server"
  "${pkgbase}-common"
)
pkgver=0.335
pkgrel=1
pkgdesc="Your shell history: synced, queryable, and in context"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://hishtory.dev"
_url="https://github.com/ddworken/${pkgbase}"
license=('MIT')
makedepends=(
  'go'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f312acc99195ca035db7b6612408169ce3a14c170f85dba238f9a29ca7825a3d')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -x
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
  go build -v -o "build/${pkgbase}" .
  go build -v -o "build/${pkgbase}-server" ./"backend/server"

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgbase}" completion "${_sh}" > "completions/${pkgbase}.${_sh}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package_hishtory() {
  depends=(
    "${pkgbase}-common=${pkgver}"
    'glibc'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  cd "completions"
  install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -vDm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
}

package_hishtory-server() {
  pkgdesc+=" (server)"
  depends=(
    "${pkgbase}-common=${pkgver}"
    'glibc'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

package_hishtory-common() {
  pkgdesc+=" (common files)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}
