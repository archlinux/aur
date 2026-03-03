# Maintainer: Carmine Paolino <carmine@paolino.me>

pkgname=op-cache-git
_pkgname=op-cache
_owner=crmne
_repo=op-cache
_branch=fix/socket-auth-hardening
pkgver=0.0.0.r4.g6219481
pkgrel=1
pkgdesc='A fast caching proxy for 1Password CLI op read commands'
arch=('x86_64')
url="https://github.com/${_owner}/${_repo}"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('op-cache')
conflicts=('op-cache')
source=("${_repo}::git+https://github.com/${_owner}/${_repo}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_repo}"
  local desc
  desc="$(git describe --long --tags --abbrev=7 2>/dev/null || true)"
  if [[ -n "${desc}" ]]; then
    echo "${desc}" | sed 's/^v//' | sed 's/-/.r/' | sed 's/-/./'
  else
    printf '0.0.0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_repo}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/${_repo}"
  cargo test --locked
}

package() {
  cd "${srcdir}/${_repo}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
