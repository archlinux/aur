# Maintainer: Eray Aydın <erayaydinn@protonmail.com>

pkgname=sanalyer-bin
_pkgname=sanalyer
pkgver=2026.1107.110815
pkgrel=1
pkgdesc="Instant messaging and VoIP application"
arch=('x86_64')
url="https://sanalyer.com"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libfido2'
  'libnotify'
  'libpulse'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'pipewire'
  'systemd-libs'
  'xdg-utils'
)
optdepends=(
  'hunspell: system spell checking'
  'libappindicator-gtk3: tray icon support on some desktops'
  'xdg-desktop-portal: screen sharing on Wayland'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('python')
options=('!strip' '!debug')
source=("https://dl.sanalyer.com/desktop/stable/linux/x64/$_pkgname-$pkgver-linux-x64.tar.gz"
  "$_pkgname.desktop")
sha256sums=('db487d8af510fc3f45e425e9f987f82e521d9b793d0dcf2e2952b5ce7d6b36d1'
  'e89aae6002e51bd9958e64d37f66a64659be19527af45440378e2e2185ae038b')

prepare() {
  # Pull the scalable app icon out of app.asar (asar = 16-byte header + JSON index + data)
  python - "$_pkgname-$pkgver-linux-x64/resources/app.asar" dist/splash/symbol.svg \
    >"$_pkgname.svg" <<'PYEOF'
import json, struct, sys
with open(sys.argv[1], "rb") as f:
    _, header_size, _, json_size = struct.unpack("<4I", f.read(16))
    entry = json.loads(f.read(json_size))
    for part in sys.argv[2].split("/"):
        entry = entry["files"][part]
    f.seek(8 + header_size + int(entry["offset"]))
    sys.stdout.buffer.write(f.read(entry["size"]))
PYEOF
  grep -q '<svg' "$_pkgname.svg"
}

package() {
  cd "$_pkgname-$pkgver-linux-x64"

  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -a --no-preserve=ownership . "$pkgdir/opt/$_pkgname/"

  chmod 0755 "$pkgdir/opt/$_pkgname/chrome-sandbox"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "resources/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
  done
  install -Dm644 "$srcdir/$_pkgname.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  local license
  for license in LICENSE.txt LICENSE.electron.txt LICENSES.chromium.html; do
    ln -s "/opt/$_pkgname/$license" "$pkgdir/usr/share/licenses/$pkgname/$license"
  done
}
