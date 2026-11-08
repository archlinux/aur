# Maintainer: czyt <czytcn@gmail.com>

pkgname=mole-cli-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Deep clean and optimize your Linux desktop (CLI)"
arch=('x86_64' 'aarch64')
url="https://github.com/tw93/Mole"
license=('GPL-3.0-only')
depends=('bash' 'coreutils' 'findutils' 'gawk' 'grep' 'procps-ng' 'sed')
optdepends=(
  'sudo: system-wide cleanup and purge steps'
  'pacman-contrib: paccache-based package cache cleaning'
  'desktop-file-utils: refresh the desktop database after a cleanup'
  'flatpak: flatpak cleanup'
  'docker: container cleanup'
  'podman: container cleanup'
)
provides=('mole-cli')
conflicts=('mole-cli')
options=('!strip' '!debug')

_tarball_x86_64="mole-${pkgver}-linux-x86_64.tar.gz"
_tarball_aarch64="mole-${pkgver}-linux-aarch64.tar.gz"
source_x86_64=("${_tarball_x86_64}::${url}/releases/download/V${pkgver}-linux/${_tarball_x86_64}")
source_aarch64=("${_tarball_aarch64}::${url}/releases/download/V${pkgver}-linux/${_tarball_aarch64}")
sha256sums_x86_64=('e1c2352265ecdf9df9db6af0316783d682fb370c3179f0ef0371e962dc625d3d')
sha256sums_aarch64=('7b90b46e9105b6a80dcd0ee8e43931af3a0466614c89bf5bd9dfd2031013e681')

package() {
  local _srcdir="${srcdir}/mole-${pkgver}-linux-${CARCH}"

  install -d "${pkgdir}/usr/lib/mole"
  cp -a -- "${_srcdir}/." "${pkgdir}/usr/lib/mole/"
  # The upstream installer is for self-managed ~/.local installs; the launcher
  # detects a package tree and disables self-update by itself.
  rm -f "${pkgdir}/usr/lib/mole/install.sh"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/mole/mole "${pkgdir}/usr/bin/mo"

  install -Dm644 "${_srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "${pkgdir}/usr/lib/mole" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/lib/mole" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/lib/mole/mole" "${pkgdir}/usr/lib/mole/mo"
  chmod 755 "${pkgdir}/usr/lib/mole/bin/"*.sh "${pkgdir}/usr/lib/mole/bin/"*-go
}
