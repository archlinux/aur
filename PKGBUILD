pkgname=nextendo-citron-bin
_commit=4a0907181
pkgver=20261030.r${_commit}
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
sha256sums_x86_64=('f1880a9b83a43310bfec800bba97367a0dda4cba627f2be80ec1e0b9c0a8bc14')

source_aarch64=(
  "${pkgname}-${_commit}-aarch64.tar.zst::https://github.com/${_repo}/releases/download/${_release_tag}/citron_nightly-${_commit}-linux-aarch64-use-nopgo.tar.zst"
)
sha256sums_aarch64=('1b043fb12d0e8d2fcf987f3c2e6c57297ebee95385e0ba6486b18bf59bdac7bc')

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
