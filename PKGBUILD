# Maintainer: lone-cloud <lonecloud604@pm.me>

pkgname=cursor-ide-bin
pkgver=2.6.19
pkgrel=1
pkgdesc='Cursor - AI-first coding environment (uses bundled Electron)'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
provides=('cursor')
conflicts=('cursor-bin')

depends=(
  'alsa-lib'
  'dbus'
  'gcc-libs'
  'gtk3'
  'hicolor-icon-theme'
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

_commit=224838f96445be37e3db643a163a817c15b3606c
source=(
  "cursor_${pkgver}_amd64.deb::https://downloads.cursor.com/production/${_commit}/linux/x64/deb/amd64/deb/cursor_${pkgver}_amd64.deb"
  "cursor.desktop"
  "cursor-launcher.sh"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
noextract=("cursor_${pkgver}_amd64.deb")

package() {
  # Extract full deb — keep bundled Electron intact.
  bsdtar -xOf "cursor_${pkgver}_amd64.deb" data.tar.xz |
    tar -xJf - -C "$pkgdir"

  # Fix zsh completion path for Arch
  if [[ -d "$pkgdir/usr/share/zsh/vendor-completions" ]]; then
    mv "$pkgdir/usr/share/zsh/vendor-completions" \
       "$pkgdir/usr/share/zsh/site-functions"
  fi

  # Install our .desktop file
  install -Dm644 "$srcdir/cursor.desktop" \
    "$pkgdir/usr/share/applications/cursor.desktop"

  # Install icon to hicolor for KDE/GNOME
  local _icon="$pkgdir/usr/share/pixmaps/co.anysphere.cursor.png"
  if [[ -f "$_icon" ]]; then
    install -Dm644 "$_icon" \
      "$pkgdir/usr/share/icons/hicolor/512x512/apps/cursor.png"
  fi

  # Install launcher
  install -Dm755 "$srcdir/cursor-launcher.sh" "$pkgdir/usr/bin/cursor"

  # Install license
  install -Dm644 "$pkgdir/usr/share/cursor/resources/app/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # chrome-sandbox suid for non-user-namespace systems
  if [[ -f "$pkgdir/usr/share/cursor/chrome-sandbox" ]]; then
    chmod 4755 "$pkgdir/usr/share/cursor/chrome-sandbox"
  fi
}
