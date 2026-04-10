# Maintainer: Oskar Gerlicz Kowalczuk <oskar@gerlicz.space>
# Contributor: StaticNullException <aurcontact@teto.party>

pkgname=zen-browser
pkgver=1.19.6b
pkgrel=2
pkgdesc='Firefox-based web browser repackaged from upstream release artifacts'
url='https://zen-browser.app'
arch=('x86_64')
license=('MPL-2.0')
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgcc
  libpulse
  libstdc++
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
conflicts=('zen-browser-bin')
options=('!strip' '!debug')

# GitHub release 305108021, asset 388071577. GitHub release assets are mutable,
# so the checksum intentionally pins the exact artifact and fails closed on
# upstream re-rolls.
source=(
  "$pkgname-$pkgver-x86_64.tar.xz::https://github.com/zen-browser/desktop/releases/download/$pkgver/zen.linux-x86_64.tar.xz"
  "$pkgname.desktop"
)
sha256sums=(
  '87978f0854fc279191b4f95a41bdb0c5b7df6f6b6c1d986c97ef75915cd6686c'
  'af16fec9a88cbfffee34a6a4eb5b3074931477fcefee252840d77cf146568851'
)
noextract=("$pkgname-$pkgver-x86_64.tar.xz")

package() {
  local _archive="$srcdir/$pkgname-$pkgver-x86_64.tar.xz"
  local _appdir="$pkgdir/usr/lib/$pkgname"
  local _size

  install -d "$pkgdir/usr/lib"
  bsdtar -xf "$_archive" -C "$pkgdir/usr/lib"
  mv "$pkgdir/usr/lib/zen" "$_appdir"

  rm -f \
    "$_appdir/updater" \
    "$_appdir/updater.ini" \
    "$_appdir/update-settings.ini"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
exec /usr/lib/zen-browser/zen "$@"
EOF
  ln -s "$pkgname" "$pkgdir/usr/bin/zen"

  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  for _size in 16 32 48 64 128; do
    install -Dm644 \
      "$_appdir/browser/chrome/icons/default/default${_size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$pkgname.png"
  done

  install -Dm644 /dev/stdin \
    "$_appdir/browser/defaults/preferences/vendor.js" <<'EOF'
// Use LANG environment variable to choose locale.
pref("intl.locale.requested", "");

// Use system-provided dictionaries.
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Avoid first-run default browser noise on managed systems.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions shipped in application directories.
pref("extensions.autoDisableScopes", 11);
EOF

  install -Dm644 /dev/stdin "$_appdir/distribution/distribution.ini" <<EOF
[Global]
id=archlinux
version=1.0
about=Zen Browser for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
EOF

  install -Dm644 /dev/stdin "$_appdir/distribution/policies.json" <<'EOF'
{
  "policies": {
    "DisableAppUpdate": true
  }
}
EOF

  if [[ -e "$_appdir/libnssckbi.so" ]]; then
    ln -sf ../libnssckbi.so "$_appdir/libnssckbi.so"
  fi
}
