# Maintainer: AugusDogus <augie@linux.com>

pkgname=cursor-early-access-bin
pkgver=3.2.11
_upstream_pkgver=3.2.11
pkgrel=1
pkgdesc='AI-first coding environment (early access channel, bundled Electron)'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
provides=('cursor')
conflicts=('cursor-bin' 'cursor-nightly-bin' 'cursor-ide-bin')
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
_commit=e9ee1339915a927dfb2df4a836dd9c8337e17cc2
source=(
  "cursor_${_upstream_pkgver}_amd64.deb::https://downloads.cursor.com/production/${_commit}/linux/x64/deb/amd64/deb/cursor_${_upstream_pkgver}_amd64.deb"
  cursor.desktop
  cursor-launcher.sh
)
sha512sums=('SKIP'
  '037aa5d878eddb06fc1d5be788e7bc64545773decacb34228053be746dfc33237371ad49cc331dac8e3437d7d885a9bc1564d0f114fc22e308827b33d0c55ad8'
  'd506855a2fe848b9ed24c4d56ec75ce8cd4c5402127f78d31bde8e474fccfd1b5d85bfd4d5688eefdd16622ceaad6727f678c0239f6ac3c66244330cc27cc9a8')
sha512sums[0]=4d3fd6fe08e067f5455278f783c4a0ad2651902faf9e83b54304c3377f706e9cd5820c1639067beeb96a6d107770ab86725b1f2aabd138e2979c4335fceb20d6
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













