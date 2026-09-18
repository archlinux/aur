# Maintainer: Fahim <contact@scirex.me>

pkgname=commandcode-bin
_pkgname=commandcode
pkgver=0.1.32
pkgrel=1
pkgdesc="Command Code desktop app"
arch=('x86_64')
url="https://github.com/CommandCodeAI/desktop"
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'glibc'
  'gtk3'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'xdg-utils'
)
provides=("${_pkgname}=${pkgver}" "command-code=${pkgver}" "command-code-bin=${pkgver}")
conflicts=("${_pkgname}" "command-code" "command-code-bin")
options=('!strip' '!debug')

source=("${pkgname}-${pkgver}.deb::https://github.com/CommandCodeAI/desktop/releases/download/v${pkgver}/CommandCode-${pkgver}-amd64.deb")
sha256sums=('4bc40498e63c1ea06909e2375a87f77624ad70fc7e792d891fcb7701400ecc1e')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/Command Code/command-code" "${pkgdir}/usr/bin/command-code"
  ln -sf "/opt/Command Code/command-code" "${pkgdir}/usr/bin/commandcode"

  # Fix permissions on chrome-sandbox
  chmod 4755 "${pkgdir}/opt/Command Code/chrome-sandbox" || true

  # Optional apparmor profile
  if [[ -f "${pkgdir}/opt/Command Code/resources/apparmor-profile" ]]; then
    install -Dm644 "${pkgdir}/opt/Command Code/resources/apparmor-profile" "${pkgdir}/etc/apparmor.d/command-code"
  fi
}
