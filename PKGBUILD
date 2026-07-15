# Maintainer: Braulio Oliveira <brauliobo@gmail.com>

_pkgname=thorium-browser
pkgname=thorium-browser-updated-bin
pkgver=150.0.7871.124
pkgrel=1
_thorium_commit=1e989d9f4aa67070e40b10718062675e79e66f19
pkgdesc="Chromium fork focused on high performance and security, packaged from updated binaries"
arch=('x86_64')
url="https://github.com/brauliobo/thorium"
license=('BSD-3-Clause')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'libcups'
  'libnotify'
  'libxcomposite'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
)
makedepends=('libarchive')
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
  'kdialog: support for native dialogs in Plasma'
  'org.freedesktop.secrets: password storage backend on GNOME, KDE and Xfce'
)
provides=('thorium-browser')
conflicts=('thorium-browser' 'thorium-browser-bin' 'thorium-browser-updated')
options=('!emptydirs' '!strip' '!debug')
install="${pkgname}.install"
source=("https://github.com/brauliobo/thorium/releases/download/M${pkgver}-updated/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('77bc4afd0920d4ebbac387026e559ef37f29ec435291680701bf442cc3c3cf22')
noextract=("${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")

package() {
  echo "  -> Extracting Arch package payload..."
  bsdtar -C "$pkgdir" -xf "${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"

  rm -f \
    "$pkgdir/.BUILDINFO" \
    "$pkgdir/.MTREE" \
    "$pkgdir/.PKGINFO"

  rm -f \
    "$pkgdir/opt/thorium-browser/thorium_shell" \
    "$pkgdir/opt/thorium-browser/thorium_shell.png" \
    "$pkgdir/usr/bin/thorium-shell" \
    "$pkgdir/usr/share/applications/thorium-shell.desktop" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/thorium-shell.png" \
    "$pkgdir/usr/bin/thorium-browser-stable" \
    "$pkgdir/usr/share/man/man1/thorium-browser-stable.1" \
    "$pkgdir/usr/share/man/man1/thorium-browser-stable.1.gz"

  find "$pkgdir/usr/share/applications" -name '*.desktop' -type f -exec \
    sed -i 's@/usr/bin/thorium-browser-stable@/usr/bin/thorium-browser@g' {} +

  chmod 4755 "$pkgdir/opt/thorium-browser/chrome-sandbox"
  find "$pkgdir" -type d -exec chmod 755 {} +
}
