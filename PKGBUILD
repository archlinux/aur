# Maintainer: hellopoisonx <x1665341912@gmail.com>

_pkgname=quaver-music
pkgname=${_pkgname}-appimage
pkgver=1.7.2
pkgrel=1
pkgdesc="Third-party QQ Music client built with Electron (AppImage)"
arch=('x86_64')
url="https://github.com/Team-Quaver/${_pkgname}"
license=('AGPL-3.0-only')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'fuse2'
  'gcc-libs'
  'glib2'
  'gtk3'
  'libcups'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)
optdepends=(
  'libsecret: encrypted credential storage'
  'xdg-desktop-portal: global hotkey support'
)
provides=('quaver-music')
conflicts=('quaver-music' 'quaver-music-bin')
options=('!strip' '!debug')

_asset="Quaver-${pkgver}-x86_64.AppImage"
source=("${_asset}::${url}/releases/download/v${pkgver}/${_asset}")
sha256sums=('69f26230a40da93d8a43910784d125f9e7f3db50a82ded6d7f562b7cf564863f')

prepare() {
  cd "$srcdir"
  rm -rf squashfs-root

  chmod +x "$_asset"

  # The AppImage runtime can extract itself without FUSE. Pull only the
  # desktop entry and hicolor icons; the AppImage itself is installed as-is.
  ./"$_asset" --appimage-extract 'red.0w0.quaver.desktop' >/dev/null
  ./"$_asset" --appimage-extract 'usr/share/icons/*' >/dev/null
}

package() {
  cd "$srcdir"

  install -Dm755 "$_asset" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/$_pkgname.AppImage" "$pkgdir/usr/bin/$_pkgname"

  # Keep the upstream desktop file name so the application's own integration
  # can overwrite the user-level copy without creating a duplicate menu entry.
  sed -e 's|^Exec=.*|Exec=quaver-music %U|' \
      -e 's|^Categories=.*|Categories=AudioVideo;Audio;|' \
      squashfs-root/red.0w0.quaver.desktop > "${pkgname}.desktop"
  install -Dm644 "${pkgname}.desktop" \
    "$pkgdir/usr/share/applications/red.0w0.quaver.desktop"

  local icon
  while IFS= read -r -d '' icon; do
    install -Dm644 "$icon" "$pkgdir/usr/${icon#squashfs-root/usr/}"
  done < <(find squashfs-root/usr/share/icons -type f -name 'red.0w0.quaver.png' -print0)
}
