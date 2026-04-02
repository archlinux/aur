# Maintainer: AugusDogus <augie@linux.com>

pkgname=cursor-nightly-bin
pkgver=2.7.0_pre.180.patch.0
_upstream_pkgver=2.7.0-pre.180.patch.0
pkgrel=1
pkgdesc='AI-first coding environment (nightly channel, bundled Electron)'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
provides=('cursor')
conflicts=('cursor-bin' 'cursor-early-access-bin' 'cursor-ide-bin')
depends=(
  'alsa-lib'
  'dbus'
  'gcc-libs'
  'gtk3'
  'libdrm'
  'libsecret'
  'libxkbfile'
  'mesa'
  'nss'
  'xdg-utils'
)
optdepends=(
  'libnotify: desktop notifications'
  'org.freedesktop.secrets: credential storage via SecretService'
  'libdbusmenu-glib: KDE global menu support'
)
options=(!strip !debug)
_commit=f1480c9f818dce3c34ccd3ac3b30ccd61a37005b
source=(
  "cursor_${_upstream_pkgver}_amd64.deb::https://downloads.cursor.com/production/${_commit}/linux/x64/deb/amd64/deb/cursor_${_upstream_pkgver}_amd64.deb"
  cursor.desktop
  cursor-launcher.sh
)
sha512sums=('SKIP'
  '008c71cc0c4afec88ebfb177a6f40e3d178db9b622bec520c73c548a94cb674a5bd1b9f2f2a4329775183ca7a7a3ca65cb37a28c5d4d2667b1d65ee9342c54f0'
  'd506855a2fe848b9ed24c4d56ec75ce8cd4c5402127f78d31bde8e474fccfd1b5d85bfd4d5688eefdd16622ceaad6727f678c0239f6ac3c66244330cc27cc9a8')
sha512sums[0]=1695daf3b529d8c222e910c4871f14f463ac306a4d5d4f2c7bdf559da4bb65b19184bbfd64fc588e50a7dae44274561a4cf5c88e59059f1f27fbe37f2cf3f7e0
noextract=("cursor_${_upstream_pkgver}_amd64.deb")

package() {
  # Extract full deb — keep bundled Electron intact.
  bsdtar -xOf "cursor_${_upstream_pkgver}_amd64.deb" data.tar.xz |
    tar -xJf - -C "$pkgdir"

  # Fix zsh completion path for Arch
  if [[ -d "$pkgdir/usr/share/zsh/vendor-completions" ]]; then
    mv "$pkgdir/usr/share/zsh/vendor-completions" \
       "$pkgdir/usr/share/zsh/site-functions"
  fi

  install -Dm644 "$srcdir/cursor.desktop" \
    "$pkgdir/usr/share/applications/cursor.desktop"

  install -Dm755 "$srcdir/cursor-launcher.sh" "$pkgdir/usr/bin/cursor"

  _license="$pkgdir/usr/share/cursor/resources/app/LICENSE.txt"
  if [[ ! -f "$_license" ]]; then
    _license=$(find "$pkgdir/usr/share/cursor" -maxdepth 8 -type f \( -name 'LICENSE.txt' -o -name 'LICENSE' \) -print -quit 2>/dev/null)
  fi
  if [[ -f "$_license" ]]; then
    install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  else
    echo "Warning: Cursor license file not found in .deb; skipping /usr/share/licenses install" >&2
  fi

  if [[ -f "$pkgdir/usr/share/cursor/chrome-sandbox" ]]; then
    chmod 4755 "$pkgdir/usr/share/cursor/chrome-sandbox"
  fi
}
















