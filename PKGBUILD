# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cxcli"
pkgname="${_pkgname}-git"
pkgver=1.229.0.r0.g21ed847
pkgrel=1
pkgdesc="The missing CLI for your Dialogflow CX projects"
arch=('x86_64')
url="https://cxcli.xavidop.me"
_url="https://github.com/xavidop/dialogflow-cx-cli"
license=('Apache-2.0')
makedepends=('git' 'go')
depends=('glibc')
provides=("${_pkgname}=${pkgver%%.r*}" "dialogflow-cx-cli=${pkgver%%.r*}")
conflicts=("${_pkgname}" 'dialogflow-cx-cli')
_pkgsrc="dialogflow-cx-cli"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions" "manpages"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${_pkgname}" .

  # ./"scripts/manpages.sh"
  ./"build/${_pkgname}" man > "manpages/${_pkgname}.1"

  #./"scripts/completions.sh"
  for _sh in bash fish zsh powershell; do
    ./"build/${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -Dm644 "manpages/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  cd "completions"
  install -Dm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}
