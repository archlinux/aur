# Maintainer: omartelo <meopedevts@proton.me>
# Rendered by .github/workflows/release.yml (0.53.0 -> tag, checksums via
# updpkgsums) and pushed to the AUR — edit this template, never the AUR copy.
pkgname=lich-bin
pkgver=0.53.0
pkgrel=1
pkgdesc="A terminal-first ADE for the coding agents you already use"
arch=('x86_64')
url="https://github.com/omartelo/lich"
license=('AGPL-3.0-only')
provides=('lich')
conflicts=('lich')
# What the window links against; the same list, per format, lives in
# build/linux/nfpm/nfpm.yaml.
depends=('glibc' 'gcc-libs' 'nss' 'nspr' 'glib2' 'at-spi2-core' 'dbus' 'libcups'
         'libx11' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr'
         'libxcb' 'mesa' 'expat' 'libxkbcommon' 'cairo' 'pango' 'systemd-libs'
         'alsa-lib')
optdepends=('zenity: native folder picker')
source=("lich-v${pkgver}-linux-amd64.tar.zst::${url}/releases/download/v${pkgver}/lich-v${pkgver}-linux-amd64.tar.zst"
        "lich-${pkgver}.desktop::https://raw.githubusercontent.com/omartelo/lich/v${pkgver}/build/linux/lich.desktop"
        "lich-${pkgver}.png::https://raw.githubusercontent.com/omartelo/lich/v${pkgver}/build/appicon.png")
sha256sums=('3464bfdd4215747a00ebaf5dc7dfb2d9d59ef02d9fc9f22ea7156610368517cb'
            '6af34ff31490c369e1f4266b355a6a10bd0817fed0b61793ce163ac6bfa14769'
            '75aa775e531ad495d905a37f07e8e608f4d93e4b2ff1d4b145a764e71ac48b0a')

package() {
  # makepkg unpacks the release tarball: lich, and its window in shell/, which
  # /usr/bin/lich looks for at /usr/lib/lich/shell.
  install -Dm755 lich "${pkgdir}/usr/bin/lich"
  install -d "${pkgdir}/usr/lib/lich"
  cp -a shell "${pkgdir}/usr/lib/lich/shell"
  # Chromium reads its setuid sandbox helper from cef/, beside libcef.so, and
  # aborts the window when the one there is not root-owned (fakeroot) and 4755.
  chmod 4755 "${pkgdir}/usr/lib/lich/shell/cef/chrome-sandbox"
  install -Dm644 "lich-${pkgver}.desktop" "${pkgdir}/usr/share/applications/lich.desktop"
  install -Dm644 "lich-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lich.png"
}
