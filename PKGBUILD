pkgname=nextendo-citron-bin
_commit=c6e50d1e4
pkgver=20261031.r${_commit}
pkgrel=1
pkgdesc="Nintendo Switch emulator (Citron nightly build from NextendoNetwork)"
arch=('x86_64' 'aarch64')
url="https://github.com/NextendoNetwork/citron-nextendo"
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'zlib'
  'fuse2'
  'hicolor-icon-theme'
)
optdepends=(
  'vulkan-driver: Vulkan graphics backend support'
  'libva: Hardware video decoding support'
)
provides=('citron')
conflicts=('citron' 'citron-neo' 'citron-neo-git' 'citron-neo-nightly-bin')
options=('!strip')

_repo="NextendoNetwork/citron-nextendo"
_release_tag="nightly-linux"

source_x86_64=(
  "${pkgname}-${_commit}-x86_64.tar.zst::https://github.com/${_repo}/releases/download/${_release_tag}/citron_nightly-${_commit}-linux-x86_64-use-nopgo.tar.zst"
)
sha256sums_x86_64=('a83939202bf665ca70ddba2e9ca9a5803741076b524f476be1689b49fbe6c3e9')

source_aarch64=(
  "${pkgname}-${_commit}-aarch64.tar.zst::https://github.com/${_repo}/releases/download/${_release_tag}/citron_nightly-${_commit}-linux-aarch64-use-nopgo.tar.zst"
)
sha256sums_aarch64=('882a204ca3f65e4f41e7343186b2ad184f4b5d5df259e6ffa55661404a89e639')

package() {
  local _installdir="${pkgdir}/opt/nextendo-citron"

  # Install payload
  install -dm755 "${_installdir}"
  cp -a "${srcdir}"/{bin,lib,shared,sharun,AppRun*,org.citron_emu.citron.*} "${_installdir}/"

  # Install binary symlinks in PATH
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/nextendo-citron/AppRun" "${pkgdir}/usr/bin/citron"
  ln -sf "/opt/nextendo-citron/AppRun" "${pkgdir}/usr/bin/nextendo-citron"

  # Install Desktop file with proper Exec path
  install -Dm644 "${srcdir}/org.citron_emu.citron.desktop" \
    "${pkgdir}/usr/share/applications/org.citron_emu.citron.desktop"
  sed -i 's|^Exec=.*|Exec=/usr/bin/citron %f|' \
    "${pkgdir}/usr/share/applications/org.citron_emu.citron.desktop"

  # Install icon to hicolor theme directory
  install -Dm644 "${srcdir}/org.citron_emu.citron.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/org.citron_emu.citron.png"
}
