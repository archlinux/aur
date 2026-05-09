# Maintainer: nikzmx

pkgname=kick-bin
_pkgname=kick
pkgver=1.4.1
pkgrel=1
pkgdesc='Local OpenAI-compatible proxy for Gemini CLI and Kiro'
arch=('x86_64')
url='https://github.com/mxnix/kick'
license=('Apache-2.0')

depends=(
  'gtk3'
  'curl'
  'libsecret'
  'jsoncpp'
  'libayatana-appindicator'
  'libnotify'
  'hicolor-icon-theme'
)

makedepends=(
  'patchelf'
)

provides=('kick')
conflicts=('kick')

source=(
  "kick-linux-x64-${pkgver}.tar.gz::https://github.com/mxnix/kick/releases/download/v${pkgver}/kick-linux-x64-${pkgver}.tar.gz"
  "com.nikzmx.kick.desktop::https://raw.githubusercontent.com/mxnix/kick/v${pkgver}/installer/linux/com.nikzmx.kick.desktop"
  "com.nikzmx.kick.metainfo.xml::https://raw.githubusercontent.com/mxnix/kick/v${pkgver}/installer/linux/com.nikzmx.kick.metainfo.xml"
  "com.nikzmx.kick.png::https://raw.githubusercontent.com/mxnix/kick/v${pkgver}/static/github/logo/logo.png"
  "LICENSE.md::https://raw.githubusercontent.com/mxnix/kick/v${pkgver}/LICENSE.md"
)

noextract=("kick-linux-x64-${pkgver}.tar.gz")

sha256sums=('ae804ac13a9be56f7e353eec13e775fef701a99c40f0a2bc8ed3af21bc991aa7'
            '4a0b715b3477d8d1ed829e57d6abfcb1c49d7152450b62e39f1a69a27fc6d9de'
            '5bab3301b9b65c0bf7373e311644de985bc34286cbf867156570c0570cb353aa'
            'dc402b8522496ca0df21d702646466370671ffb347a76631983e3c86dd88db5a'
            '58e1914fa476cf3e2e6298ed28f0486940ea2718f0875e0044f3cee32e26aa61')

package() {
  install -dm755 "$pkgdir/usr/lib/kick"

  tar -xzf "$srcdir/kick-linux-x64-${pkgver}.tar.gz" \
    -C "$pkgdir/usr/lib/kick" \
    --no-same-owner \
    --no-same-permissions

  chown -R root:root "$pkgdir/usr/lib/kick"

  chmod 755 "$pkgdir/usr/lib/kick/kick"

  if [[ -f "$pkgdir/usr/lib/kick/lib/crashpad_handler" ]]; then
    chmod 755 "$pkgdir/usr/lib/kick/lib/crashpad_handler"
  fi

  # Fix upstream Flutter/GitHub Actions RUNPATHs.
  if [[ -x "$pkgdir/usr/lib/kick/kick" ]]; then
    patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/usr/lib/kick/kick" || true
  fi

  if [[ -f "$pkgdir/usr/lib/kick/lib/crashpad_handler" ]]; then
    patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/kick/lib/crashpad_handler" || true
  fi

  if [[ -d "$pkgdir/usr/lib/kick/lib" ]]; then
    find "$pkgdir/usr/lib/kick/lib" -maxdepth 1 -type f -name '*.so' \
      -exec patchelf --set-rpath '$ORIGIN' {} \; || true
  fi

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/kick" <<'EOF'
#!/usr/bin/env sh
exec /usr/lib/kick/kick "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/kick"

  install -Dm644 "$srcdir/com.nikzmx.kick.desktop" \
    "$pkgdir/usr/share/applications/com.nikzmx.kick.desktop"

  install -Dm644 "$srcdir/com.nikzmx.kick.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.nikzmx.kick.png"

  install -Dm644 "$srcdir/com.nikzmx.kick.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/com.nikzmx.kick.metainfo.xml"

  install -Dm644 "$srcdir/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
