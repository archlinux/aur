# Maintainer: omartelo <meopedevts@proton.me>
# Rendered by .github/workflows/release.yml (0.72.0 -> tag, checksums via
# updpkgsums) and pushed to the AUR — edit this template, never the AUR copy.
pkgname=lich-bin
pkgver=0.72.0
pkgrel=1
pkgdesc="A terminal-first ADE for the coding agents you already use"
arch=('x86_64')
url="https://github.com/lichdotdev/lich"
license=('AGPL-3.0-only')
provides=('lich')
conflicts=('lich')
# What the window and the native window link against; the same list, per
# format, lives in build/linux/nfpm/nfpm.yaml.
depends=('glibc' 'gcc-libs' 'nss' 'nspr' 'glib2' 'at-spi2-core' 'dbus' 'libcups'
         'libx11' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr'
         'libxcb' 'mesa' 'expat' 'libxkbcommon' 'cairo' 'pango' 'systemd-libs'
         'alsa-lib' 'libglvnd' 'wayland' 'libxkbcommon-x11' 'libxcursor' 'fontconfig')
optdepends=('zenity: native folder picker')
source=("lich-v${pkgver}-linux-amd64.tar.zst::${url}/releases/download/v${pkgver}/lich-v${pkgver}-linux-amd64.tar.zst"
        "lich-${pkgver}.desktop::https://raw.githubusercontent.com/lichdotdev/lich/v${pkgver}/build/linux/lich.desktop"
        "lich-${pkgver}.png::https://raw.githubusercontent.com/lichdotdev/lich/v${pkgver}/build/appicon.png")
sha256sums=('5d06aaa046aef82370ae27984ef1c6fc3c47a72e13a3ce60e9af22c37a3965d1'
            '6af34ff31490c369e1f4266b355a6a10bd0817fed0b61793ce163ac6bfa14769'
            '75aa775e531ad495d905a37f07e8e608f4d93e4b2ff1d4b145a764e71ac48b0a')

package() {
  # makepkg unpacks the release tarball: lich, lich-native, and its window in shell/, which
  # /usr/bin/lich looks for at /usr/lib/lich/shell.
  install -Dm755 lich "${pkgdir}/usr/bin/lich"
  install -Dm755 lich-native "${pkgdir}/usr/bin/lich-native"
  install -d "${pkgdir}/usr/lib/lich"
  cp -a shell "${pkgdir}/usr/lib/lich/shell"
  # Chromium reads its setuid sandbox helper from cef/, beside libcef.so, and
  # aborts the window when the one there is not root-owned (fakeroot) and 4755.
  chmod 4755 "${pkgdir}/usr/lib/lich/shell/cef/chrome-sandbox"
  install -Dm644 "lich-${pkgver}.desktop" "${pkgdir}/usr/share/applications/lich.desktop"
  install -Dm644 "lich-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lich.png"
}
