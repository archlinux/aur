# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="cxcli"
pkgver=1.227.0
pkgrel=1
pkgdesc="The missing CLI for your Dialogflow CX projects"
arch=('any')
url="https://${pkgname}.xavidop.me"
_url="https://github.com/xavidop/dialogflow-cx-cli"
license=('Apache-2.0')
makedepends=('go')
depends=('glibc')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
provides=("${pkgname}" 'dialogflow-cx-cli')
conflicts=("${pkgname}" 'dialogflow-cx-cli')
_pkgsrc="dialogflow-cx-cli-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9fe126812e790a26717abaa59ffb043a06713b86ac61291ae072ef016cb9d6bd')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions" "manpages"
  go mod download
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/${pkgname}" .

  # ./"scripts/manpages.sh"
  ./"build/${pkgname}" man > "manpages/${pkgname}.1"

  #./"scripts/completions.sh"
  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 "manpages/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  cd "completions"
  install -Dm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
}
