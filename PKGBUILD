# Maintainer: bit-loop <isaiah.fpga@gmail.com>

_pkgname=ssh-multisession-resume
pkgname=${_pkgname}-git
pkgver=0.r3.g7cb8713
pkgrel=1
pkgdesc='Persistent multi-session SSH auto-resume utility backed by tmux'
arch=('any')
url="https://github.com/Bit-Loop/${_pkgname}"
license=('MIT')
depends=('bash' 'openssh')
makedepends=('git')
optdepends=(
  'tmux: preferred persistent terminal backend'
  'screen: fallback terminal backend'
  'sudo: allow non-root installer runs to apply SSHD changes'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Bit-Loop/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

package() {
  cd "${_pkgname}"

  install -Dm755 install.sh "${pkgdir}/usr/lib/${_pkgname}/install.sh"
  install -Dm755 client/install.sh "${pkgdir}/usr/lib/${_pkgname}/client/install.sh"
  install -Dm755 client/auto-resume.sh "${pkgdir}/usr/lib/${_pkgname}/client/auto-resume.sh"
  install -Dm755 client/auto-screen.sh "${pkgdir}/usr/lib/${_pkgname}/client/auto-screen.sh"
  install -Dm644 client/tmux-auto-resume.conf "${pkgdir}/usr/lib/${_pkgname}/client/tmux-auto-resume.conf"
  install -Dm644 client/screen-auto-resume.screenrc "${pkgdir}/usr/lib/${_pkgname}/client/screen-auto-resume.screenrc"
  install -Dm644 client/screen-hangup-off.screenrc "${pkgdir}/usr/lib/${_pkgname}/client/screen-hangup-off.screenrc"
  install -Dm755 server/install.sh "${pkgdir}/usr/lib/${_pkgname}/server/install.sh"
  install -Dm644 server/01-sshd-auto-resume.conf "${pkgdir}/usr/lib/${_pkgname}/server/01-sshd-auto-resume.conf"
  install -Dm755 tests/smoke.sh "${pkgdir}/usr/share/${_pkgname}/tests/smoke.sh"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/usr/bin/env bash
exec /usr/lib/${_pkgname}/install.sh "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
}
