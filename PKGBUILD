# Maintainer:  dreieck (https://aur.archlinux.org/account/moe_narrow)
# Contributor: Moses Narrow (https://aur.archlinux.org/account/moe_narrow)

pkgname=skyline-commander-git
_pkgname=${pkgname/-git/}
_githuborg=vit1251
pkgdesc="Golang reimplementation of Midnight Commander."
_pkggopath="github.com/${_githuborg}/${_pkgname}"
epoch=1
pkgver=r22.d20211218.gb21c999
pkgrel=1
arch=(
  'i686'
  'x86_64'
  'aarch64'
  'armv8'
  'armv7'
  'armv7l'
  'armv7h'
  'armv6h'
  'armhf'
  'armel'
  'arm'
  'riscv'
  'riscv64'
)
url="https://${_pkggopath}"
license=('custom:license-free')
depends=(
  'glibc'
  'ncurses'
)
makedepends=(
  'git'
  'go'
  'pkg-config'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}"

  export GOPATH="${srcdir}/go"
  export GOBIN="${GOPATH}/bin"
  export _GOAPPS="${GOPATH}/apps"
  export GOOS='linux'

  cd "${srcdir}/${_pkgname}"

  go get

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  _hash="$(git rev-parse --short HEAD)"
  if [ -z ${_rev} ]; then
    error "Error in ${FUNCNAME[0]}: Git commit count could not be determined."
    return 1
  fi
  printf '%s' "r${_rev}.d${_date}.g${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/go"
  export GOBIN="${GOPATH}/bin"
  export _GOAPPS="${GOPATH}/apps"
  export GOOS='linux'

  go build .
}

package() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/go"
  export GOBIN="${GOPATH}/bin"
  export _GOAPPS="${GOPATH}/apps"
  export GOOS='linux'

  install -Dvm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  for _docfile in git.log README.md; do
    install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_docfile}"
  done
}
