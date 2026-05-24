# Maintainer: bit-loop <isaiah.fpga@gmail.com>

_pkgname=ssh-multisession-resume
pkgname=${_pkgname}-git
_srcname=${_pkgname}-source
pkgver=0.r14.g2f5195c
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

  install -Dm755 ssh-multisession-resume "${pkgdir}/usr/lib/${_pkgname}/ssh-multisession-resume"
  install -Dm755 client/install.sh "${pkgdir}/usr/lib/${_pkgname}/client/install.sh"
  install -Dm755 client/auto-resume.sh "${pkgdir}/usr/lib/${_pkgname}/client/auto-resume.sh"
  install -Dm755 client/auto-screen.sh "${pkgdir}/usr/lib/${_pkgname}/client/auto-screen.sh"
  install -Dm644 client/tmux-auto-resume.conf "${pkgdir}/usr/lib/${_pkgname}/client/tmux-auto-resume.conf"
  install -Dm644 client/screen-auto-resume.screenrc "${pkgdir}/usr/lib/${_pkgname}/client/screen-auto-resume.screenrc"
  install -Dm644 client/screen-hangup-off.screenrc "${pkgdir}/usr/lib/${_pkgname}/client/screen-hangup-off.screenrc"
  install -Dm755 server/install.sh "${pkgdir}/usr/lib/${_pkgname}/server/install.sh"
  install -Dm644 server/01-sshd-auto-resume.conf "${pkgdir}/usr/lib/${_pkgname}/server/01-sshd-auto-resume.conf"
  install -Dm755 tests/smoke.sh "${pkgdir}/usr/share/${_pkgname}/tests/smoke.sh"

  # System-wide profile.d hook: enables the SSH menu without per-user setup.
  install -Dm644 client/profile-entry.sh "${pkgdir}/etc/profile.d/${_pkgname}.sh"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 SECURITY.md "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/usr/bin/env bash
export SSH_MULTISESSION_RESUME_COMMAND=${_pkgname}
exec /usr/lib/${_pkgname}/${_pkgname} "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
}
