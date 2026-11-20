# Maintainer: westlaw
pkgname=nvforever-bin
pkgver=0.8.0
pkgrel=2
pkgdesc='Clean-room Fallout: New Vegas engine (official prebuilt release; requires game data)'
arch=('x86_64')
url='https://github.com/LootJunkieAzza/NVForever'
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'bash' 'coreutils' 'gcc-libs' 'glibc' 'libglvnd'
         'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxrandr'
         'systemd-libs' 'vulkan-icd-loader' 'wayland')
optdepends=('vulkan-driver: GPU-specific Vulkan implementation')
provides=('nvforever')
conflicts=('nvforever')
# Preserve upstream's line tables for crash reports; do not modify prebuilt binaries.
options=('!strip' '!debug')
_archive="NVForever-v${pkgver}-x86_64-unknown-linux-gnu"
_archive_sha256='be295a61c87e8c0b4acdeedc19b8d0a8d5a45ececd9e61ac7d0d1067b13c11e2'
source=("${url}/releases/download/v${pkgver}/${_archive}.tar.gz" 'nvforever.desktop')
sha256sums=("$_archive_sha256" '1927e63790d5216c4f01c1fc18142551446e685184943bc91e57a0d31a10e6e0')

package() {
  local program
  install -dm755 "${pkgdir}/opt/nvforever" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/${_archive}/." "${pkgdir}/opt/nvforever/"

  # Do not symlink the upstream launchers: they locate schemas using dirname "$0".
  for program in nvforever nvf-viewer; do
    printf '#!/bin/sh\nexec /opt/nvforever/%s.sh "$@"\n' "$program" \
      > "${pkgdir}/usr/bin/${program}"
    chmod 755 "${pkgdir}/usr/bin/${program}"
  done
  ln -s /opt/nvforever/fnvtool "${pkgdir}/usr/bin/fnvtool"
  install -Dm644 "${srcdir}/nvforever.desktop" "${pkgdir}/usr/share/applications/nvforever.desktop"
}
