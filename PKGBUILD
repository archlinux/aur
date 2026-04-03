# Maintainer: lone-cloud <lonecloud604@pm.me>

pkgname=cursor
pkgver=3.0.9
pkgrel=1
pkgdesc='The AI Code Editor'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
makedepends=('imagemagick')

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

_commit=93e276db8a03af947eafb2d10241e2de17806c29
source=(
  "cursor_${pkgver}_amd64.deb::https://downloads.cursor.com/production/${_commit}/linux/x64/deb/amd64/deb/cursor_${pkgver}_amd64.deb"
  "cursor.desktop"
  "cursor-launcher.sh"
)
sha256sums=('c96e5a9f3d72e628116bbf9aa152d0111478c3d7ffe2ac58bca42b9f72a72309'
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

  # Rename pixmap icon and trim transparent padding to match other DE icons
  if [[ -f "$pkgdir/usr/share/pixmaps/co.anysphere.cursor.png" ]]; then
    magick "$pkgdir/usr/share/pixmaps/co.anysphere.cursor.png" \
      -trim +repage -resize 950x950 -background transparent -gravity center -extent 1024x1024 \
      "$pkgdir/usr/share/pixmaps/cursor.png"
    chmod 644 "$pkgdir/usr/share/pixmaps/cursor.png"
    rm "$pkgdir/usr/share/pixmaps/co.anysphere.cursor.png"
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
