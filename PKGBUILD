# Maintainer: omartelo <meopedevts@proton.me>
# Rendered by .github/workflows/release.yml (0.49.0 -> tag, checksums via
# updpkgsums) and pushed to the AUR — edit this template, never the AUR copy.
pkgname=lich-bin
pkgver=0.49.0
pkgrel=1
pkgdesc="A personal harness for AI-assisted development"
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
source=("lich-v${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/lich-v${pkgver}-linux-amd64"
        "lich-v${pkgver}-linux-amd64-shell.tar.zst::${url}/releases/download/v${pkgver}/lich-v${pkgver}-linux-amd64-shell.tar.zst"
        "lich-${pkgver}.desktop::https://raw.githubusercontent.com/omartelo/lich/v${pkgver}/build/linux/lich.desktop"
        "lich-${pkgver}.png::https://raw.githubusercontent.com/omartelo/lich/v${pkgver}/build/appicon.png")
sha256sums=('b2827c46295e509ce86f09ebae098ca0114d3e568b57f79aef3df24598079dce'
            '60ecfd67d44dd2c59d3abd05a02e98ca5c594963ec64107ebeb49e4eacd6cafc'
            'e39c9238b56be089973c254d031be152b3d990d3bc2735d866b044833a6c1a4d'
            '75aa775e531ad495d905a37f07e8e608f4d93e4b2ff1d4b145a764e71ac48b0a')

package() {
  install -Dm755 "lich-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/lich"
  # The window (lich's own Chromium), unpacked by makepkg into shell/, where
  # /usr/bin/lich looks for it: /usr/lib/lich/shell.
  install -d "${pkgdir}/usr/lib/lich"
  cp -a shell "${pkgdir}/usr/lib/lich/shell"
  # Chromium's setuid sandbox helper, at the only path its zygote reads:
  # beside lich-shell, root-owned (install under fakeroot) and 4755. Without
  # it a desktop that denies unprivileged user namespaces opens the window
  # with --no-sandbox. The tarball's own copy under cef/ is read by nothing.
  install -m4755 shell/cef/chrome-sandbox "${pkgdir}/usr/lib/lich/shell/chrome-sandbox"
  install -Dm644 "lich-${pkgver}.desktop" "${pkgdir}/usr/share/applications/lich.desktop"
  install -Dm644 "lich-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lich.png"
}
