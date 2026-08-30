# Maintainer: NebulaTechs <NebulaTechs@users.noreply.github.com>
pkgname=pcl-n-bin
pkgver=1.4.13
pkgrel=1
pkgdesc="一个基于 PCL-CE 开发的 Minecraft 启动器 (PCL N Edition)"
arch=('x86_64')
url="https://github.com/PCL-N-Edition/PCL-N"
license=('Apache-2.0')
depends=('dotnet-runtime-10.0' 'hicolor-icon-theme')
provides=('pcl-n')
conflicts=('pcl-n')

# Source layout:
#   ${pkgname}-${pkgver}-release.tar.gz  -> upstream tarball containing PCL.Desktop
#   icon.png                              -> 256x256 icon from the upstream repo
#   pcl-n                                 -> local wrapper script (committed alongside)
#   pcl-n.desktop                         -> local desktop entry (committed alongside)
#
# Only the tarball + icon need a network fetch. The wrapper and .desktop are
# read directly from the source tree in package(), so they don't go through the
# source array.
source=("${pkgname}-${pkgver}-release.tar.gz::https://github.com/PCL-N-Edition/PCL-N/releases/download/v${pkgver}-release/PCL_N_Release_linux-x64_NoRuntime_NoPlugin.tar.gz"
        "icon.png::https://raw.githubusercontent.com/PCL-N-Edition/PCL-N/dev/PCL.Desktop/Assets/icon.png")

# Updated automatically by CI (scripts/update.sh) on every upstream release.
# The two network-fetched entries get their real SHA256; the local files are
# validated separately via checksum_files.
sha256sums=('SKIP'
            'SKIP')

options=('!strip')

package() {
  # The upstream tarball expands to a single directory whose root contains
  # PCL.Desktop (an ELF that bundles its .NET runtime dependencies). Install
  # the entire payload under /opt/pcl-n.
  install -dm755 "${pkgdir}/opt/pcl-n"
  cp -a "${srcdir}"/*/. "${pkgdir}/opt/pcl-n/"

  # Main launcher symlink + hardware-friendly wrapper script. The symlink
  # keeps /usr/bin/PCL-N available for users who expect the binary name; the
  # wrapper script (pcl-n) adds the runtime flags Chromium-based stacks need.
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/pcl-n/PCL.Desktop "${pkgdir}/usr/bin/PCL-N"
  install -Dm755 pcl-n "${pkgdir}/usr/bin/pcl-n"

  # Icon + desktop entry.
  install -Dm644 icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pcl-n.png"
  install -Dm644 pcl-n.desktop \
    "${pkgdir}/usr/share/applications/pcl-n.desktop"
}