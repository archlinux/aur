# Maintainer: bit-loop <isaiah.fpga@gmail.com>

_pkgname=ssh-multisession-resume
pkgname=${_pkgname}-git
_srcname=${_pkgname}-source
pkgver=0.r22.gdca3527
pkgrel=1
pkgdesc='Persistent multi-session SSH auto-resume utility backed by tmux'
arch=('any')
url="https://github.com/Bit-Loop/${_pkgname}"
license=('MIT')
depends=('bash' 'openssh' 'tmux' 'screen')
makedepends=('git')
checkdepends=('tmux' 'screen')
optdepends=(
  'sudo: allow non-root installer runs to apply SSHD changes'
)
install=${_pkgname}.install
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_srcname}::git+https://github.com/Bit-Loop/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_srcname}" || return

  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

check() {
  cd "${_srcname}" || return

  env -u TMUX -u STY ./tests/smoke.sh
}

package() {
  cd "${_srcname}" || return

  . packaging/payload.sh
  payload_stage_package "$PWD" "$pkgdir" "$_pkgname" "$pkgname"
}
