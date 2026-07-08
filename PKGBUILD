# Maintainer: Agustín Carrasco <asermax at gmail dot com>
pkgname=seemux-bin
_pkgname=seemux
pkgver=1.8.1
pkgrel=1
pkgdesc="A GTK4 terminal multiplexer for Linux with Claude Code integration"
arch=('x86_64')
url="https://github.com/asermax/seemux"
license=('LicenseRef-unknown')
depends=('gtk4' 'gtk4-layer-shell' 'vte4' 'glib2' 'pango' 'glibc')
optdepends=('socat: Claude Code hook communication'
            'carbonyl: terminal-based browser for browser pane support'
            'pi-coding-agent: Pi AI coding agent (for seemux-pi extension)')
provides=('seemux')
conflicts=('seemux' 'seemux-git')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("${_pkgname}-bin-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64"
                "${_pkgname}-tmux-shim-bin-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-tmux-shim-linux-x86_64")
sha256sums=('db2e9b6cdbcae4285fe52ee140f6e3eefd15c389855492ffff9cb2f34e07c953')
sha256sums_x86_64=('83f01f6a426563ea2bcf789872889a76e10e6663755ea8f76171aea0ddb6347d' '2d6c53896dc42658c636c4072db6401d375d76b57b62c1b723dfd91f2571988f')

latestver() {
  curl -s "https://api.github.com/repos/asermax/seemux/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  install -Dm755 "${_pkgname}-bin-${pkgver}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}-tmux-shim-bin-${pkgver}" "$pkgdir/usr/bin/${_pkgname}-tmux-shim"

  cd "${_pkgname}-${pkgver}"
  install -Dm644 "extra/linux/seemux.desktop" "$pkgdir/usr/share/applications/seemux.desktop"
  install -Dm644 "extra/logo/seemux-128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/seemux.png"
  install -Dm644 "extra/logo/seemux-256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/seemux.png"
  install -Dm644 "extra/logo/seemux-48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/seemux.png"
  install -Dm644 "extra/logo/seemux-512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/seemux.png"

  # Pi extension
  install -Dm644 "plugins/seemux-pi/package.json" "$pkgdir/usr/share/seemux/pi-extension/package.json"
  install -Dm644 "plugins/seemux-pi/index.ts" "$pkgdir/usr/share/seemux/pi-extension/index.ts"
}
