# Maintainer: Atomic Chat <support@atomic.chat>
#
# Generated from packaging/PKGBUILD-desktop.in in https://github.com/AtomicBot-ai/atomic-agent by
# the linux-repo workflow (scripts/linux-packages.ts pkgbuild --product desktop); change the
# template there, not this copy.

pkgname=atomic-agent-desktop-bin
pkgver=0.0.6
_version=0.0.6
pkgrel=1
pkgdesc='Desktop app for Atomic Agent: starts the bundled agent locally and gives it a chat window (https://atomicagent.io)'
arch=('x86_64' 'aarch64')
url='https://github.com/AtomicBot-ai/atomic-agent'
license=('MIT')
# The deb's Depends by their Arch names (gtk3, libnotify, nss, libxss, libxtst, xdg-utils,
# at-spi2-core, libuuid, libsecret) plus what Electron loads at run time.
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs'
         'libsecret' 'alsa-lib' 'mesa')
optdepends=('libappindicator-gtk3: tray icon')
provides=('atomic-agent-desktop')
conflicts=('atomic-agent-desktop')
# A prebuilt Electron app with the agent's Node SEA binary inside; stripping breaks both.
options=('!strip' '!debug')

# The release's deb of each architecture, repacked: electron-builder makes the deb and the rpm,
# and the AUR package comes from the same files.
_base='https://github.com/AtomicBot-ai/atomic-agent/releases/download/desktop-v0.0.6'
source_x86_64=("${_base}/Atomic-Agent-0.0.6-amd64.deb")
source_aarch64=("${_base}/Atomic-Agent-0.0.6-arm64.deb")
sha256sums_x86_64=('35bb6386416494eb12523a4147d3e090e74367d03813c00ac6e0f04d22b1f429')
sha256sums_aarch64=('40c4717eacf9aba48a938cd6ff898dcc3bacf14bd302def437bd827e82646963')
noextract=('Atomic-Agent-0.0.6-amd64.deb' 'Atomic-Agent-0.0.6-arm64.deb')

package() {
  local deb
  case "${CARCH}" in
    x86_64) deb='Atomic-Agent-0.0.6-amd64.deb' ;;
    aarch64) deb='Atomic-Agent-0.0.6-arm64.deb' ;;
  esac

  # The deb's data archive as it is: /opt/Atomic Agent (electron-builder's layout, which the app's
  # own paths assume), the .desktop file and the icons. Debian's changelog is not for pacman.
  mkdir -p "${srcdir}/deb"
  bsdtar -xf "${srcdir}/${deb}" -C "${srcdir}/deb"
  bsdtar -xf "${srcdir}"/deb/data.tar.* -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"

  # What the deb's postinst does: the command on PATH, and chrome-sandbox without SUID, since an
  # Arch kernel has user namespaces (the postinst makes the same choice on such kernels).
  install -dm755 "${pkgdir}/usr/bin"
  ln -s '/opt/Atomic Agent/atomic-agent-desktop' "${pkgdir}/usr/bin/atomic-agent-desktop"
  chmod 755 "${pkgdir}/opt/Atomic Agent/chrome-sandbox"

  install -Dm644 "${pkgdir}/opt/Atomic Agent/resources/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
