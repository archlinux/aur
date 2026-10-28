# Maintainer: Atomic Chat <support@atomic.chat>
#
# Generated from packaging/PKGBUILD-desktop.in in https://github.com/AtomicBot-ai/atomic-agent by
# the linux-repo workflow (scripts/linux-packages.ts pkgbuild --product desktop); change the
# template there, not this copy.

pkgname=atomic-agent-desktop-bin
pkgver=0.0.7
_version=0.0.7
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
_base='https://github.com/AtomicBot-ai/atomic-agent/releases/download/desktop-v0.0.7'
source_x86_64=("${_base}/Atomic-Agent-0.0.7-amd64.deb")
source_aarch64=("${_base}/Atomic-Agent-0.0.7-arm64.deb")
sha256sums_x86_64=('ebdbf174929efefd109d08a2854b57718f3260515495b4c79439d067dbde0f9e')
sha256sums_aarch64=('74271f622e60e329e876085bd84c665efd8ea3c9abf5f3c6dadd2bdeb8d864cd')
noextract=('Atomic-Agent-0.0.7-amd64.deb' 'Atomic-Agent-0.0.7-arm64.deb')

package() {
  local deb
  case "${CARCH}" in
    x86_64) deb='Atomic-Agent-0.0.7-amd64.deb' ;;
    aarch64) deb='Atomic-Agent-0.0.7-arm64.deb' ;;
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
