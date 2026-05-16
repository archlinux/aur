# Maintainer: James Brink <dev.urandom.io@gmail.com>
# Contributor: <add yourself when you start helping out>

pkgname=claudex-git
_pkgname=claudex
pkgver=0.4.0.r0.g0000000
pkgrel=1
pkgdesc="Query, search, and analyze Claude Code sessions from the command line (built from main)"
arch=('x86_64' 'aarch64')
url="https://github.com/utensils/claudex"
license=('MIT')

depends=()

optdepends=(
  'bash-completion: Bash tab completion'
  'zsh-completions: Zsh tab completion (also auto-found via /usr/share/zsh/site-functions)'
  'fish: Fish tab completion'
)

makedepends=(
  'git'
  'rust>=1.95'
  'cargo'
)

provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}" 'claudex-bin')

options=(!lto)

# `${_pkgname}::` aliases the checkout directory inside $srcdir so
# the build helpers below can `cd "${_pkgname}"` regardless of how
# git's URL maps to a directory name.
source=("${_pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')

# Arch convention for VCS pkgver:  <upstream-tag>.r<commits-since-tag>.g<short-sha>
# e.g. 0.4.0.r17.g3fa19b0c
pkgver() {
  cd "${_pkgname}"
  local tag
  tag="$(git describe --tags --abbrev=0 --match='v*' 2>/dev/null || echo 'v0.0.0')"
  printf '%s.r%s.g%s' \
    "${tag#v}" \
    "$(git rev-list --count "${tag}..HEAD")" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --release --frozen
}

package() {
  cd "${_pkgname}"

  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # clap_complete dynamic codegen bakes argv[0] into the script —
  # invoke via PATH so the completion references the bare name
  # `claudex` instead of an absolute $pkgdir path. See claudex-bin
  # PKGBUILD for the full explanation.
  install -d \
    "${pkgdir}/usr/share/bash-completion/completions" \
    "${pkgdir}/usr/share/zsh/site-functions" \
    "${pkgdir}/usr/share/fish/vendor_completions.d"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_pkgname} completions bash \
    > "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_pkgname} completions zsh \
    > "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_pkgname} completions fish \
    > "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
