pkgname=nextendo-citron-bin
_commit=2f36977b8
pkgver=20261029.r${_commit}
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
sha256sums_x86_64=('054c86093ffd907cfd392bfec96c919f833c82865cee7902260464d3c58992f1')

source_aarch64=(
  "${pkgname}-${_commit}-aarch64.tar.zst::https://github.com/${_repo}/releases/download/${_release_tag}/citron_nightly-${_commit}-linux-aarch64-use-nopgo.tar.zst"
)
sha256sums_aarch64=('eda341318940e5c38b173dde7196d5e6a52b4b90f2d0ce295bcea5518051c829')

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
