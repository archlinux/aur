# Maintainer: Fahim Montasir Misbah <fahim@scirex.me>

pkgname=commandcode-bin
_pkgname=commandcode
pkgver=0.1.35
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
sha256sums=('2d281c1a552e5c6b48cc37d9978170cdb359ec76e91e52073b0212dd9eec1387')

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
