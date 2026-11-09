# Maintainer: hellopoisonx <x1665341912@gmail.com>

_pkgname=quaver-music-beta
pkgname=${_pkgname}-appimage
pkgver=2.0.0_beta.0
pkgrel=1
# Upstream tag/asset version keeps the prerelease dash; pkgver cannot contain
# one, hence the '_' substitution (`2.0.0-beta.0` -> `2.0.0_beta.0`).
_upstream_ver=2.0.0-beta.0
pkgdesc="Third-party QQ Music client built with Electron (beta AppImage)"
arch=('x86_64')
url="https://github.com/Team-Quaver/quaver-music"
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
  'gnome-keyring: Secret Service daemon for encrypted credential storage'
  'kwallet: KWallet daemon for encrypted credential storage (Plasma 6)'
  'kwallet5: KWallet daemon for encrypted credential storage (Plasma 5)'

)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin" 'quaver-music' 'quaver-music-bin' 'quaver-music-appimage')
options=('!strip' '!debug')

_asset="Quaver-${_upstream_ver}-x86_64.AppImage"
source=("${_asset}::${url}/releases/download/v${_upstream_ver}/${_asset}")
sha256sums=('ea3a708a5127558afd20356c747e6267a63c1a4898e589db5f38bf4f2a1c5f14')

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
  sed -e "s|^Exec=.*|Exec=$_pkgname %U|" \
      -e 's|^Categories=.*|Categories=AudioVideo;Audio;|' \
      squashfs-root/red.0w0.quaver.desktop > "${pkgname}.desktop"
  install -Dm644 "${pkgname}.desktop" \
    "$pkgdir/usr/share/applications/red.0w0.quaver.desktop"

  local icon
  while IFS= read -r -d '' icon; do
    install -Dm644 "$icon" "$pkgdir/usr/${icon#squashfs-root/usr/}"
  done < <(find squashfs-root/usr/share/icons -type f -name 'red.0w0.quaver.png' -print0)
}
