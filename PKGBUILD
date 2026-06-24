# Maintainer: AugusDogus <augie@linux.com>

pkgname=cursor-early-access-bin
pkgver=3.8.24
_upstream_pkgver=3.8.24
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
_commit=cf80f4b937f3b9c48070d7085129a838ce7876a3
source=(
  "cursor_${_upstream_pkgver}_amd64.deb::https://downloads.cursor.com/production/${_commit}/linux/x64/deb/amd64/deb/cursor_${_upstream_pkgver}_amd64.deb"
  cursor.desktop
  cursor-launcher.sh
)
sha512sums=('SKIP'
  '037aa5d878eddb06fc1d5be788e7bc64545773decacb34228053be746dfc33237371ad49cc331dac8e3437d7d885a9bc1564d0f114fc22e308827b33d0c55ad8'
  '9defecd35fd033a484642732605264cc00faf5791d852234d9705bf9ac005c76173780cd496208e4150685ac9ddbb73c8eb87cd5141526dd4521d455342e8233')
sha512sums[0]=f87532a7fb7d3bf44a6145992c00ff5087ecc21b8eec2e54f2f3e84a2a122e172f61a2e4d0cdeede973e86ad901ff3f01e7db68b24ab28fa58654c635227e5bf
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



































