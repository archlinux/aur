# Maintainer: westlaw
pkgname=nvforever-bin
pkgver=0.5.1
pkgrel=1
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
source=("${url}/releases/download/v${pkgver}/${_archive}.tar.gz")
sha256sums=('301b39b587ce3f6b427d8e3433c5b5035d400deb6d8cbfbeca14752dc401c186')

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
}
