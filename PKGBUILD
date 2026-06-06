# Maintainer: Serph91P <aur+beeper-bin@users.noreply.github.com>
# Generated-maintenance note: scripts/aur_update.py updates pkgver, source and sha256sums.

_pkgname='beeper'
_install_path='opt'

pkgname='beeper-bin'
pkgver=4.2.908
pkgrel=1
pkgdesc='The ultimate messaging app'
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'hicolor-icon-theme')
url='https://www.beeper.com/beta'
license=('LicenseRef-beeper')
arch=('x86_64')
options=('!strip' '!debug')
conflicts=('beeper' 'beeper-v4-bin')
provides=('beeper')

source=('Beeper-4.2.908-x86_64.AppImage::https://beeper-desktop.download.beeper.com/builds/Beeper-Nightly-4.2.908-x86_64.AppImage')
sha256sums=('b2aa7d8dd98df3cdf0d9f3bdb8f9888e929cc25221705ad2c23b245bb9d53d3b')

build() {
  local _filename="Beeper-${pkgver}-x86_64.AppImage"

  chmod +x "$srcdir/$_filename"
  "$srcdir/$_filename" --appimage-extract

  sed -Ei     's@^(if \[ -z "\$APPDIR" \] ; then)$@APPDIR="/'"$_install_path"'/beeper"\n\1@'     "$srcdir/squashfs-root/AppRun"
}

_package_beeper() {
  install -Dm755 "$srcdir/squashfs-root/AppRun" "$pkgdir/usr/bin/beeper"

  install -dm755 "$pkgdir/$_install_path"
  mv "$srcdir/squashfs-root" "$pkgdir/$_install_path/beeper"

  rm -f "$pkgdir/$_install_path/beeper/beepertexts.desktop"

  local _main_dir="$pkgdir/$_install_path/beeper/resources/app/build/main"
  local _linux_config_file
  _linux_config_file=$(grep -lE 'export\{[a-zA-Z0-9_]+ as registerLinuxConfig\};' "$_main_dir"/*.mjs | head -n1)
  if [ -z "$_linux_config_file" ]; then
    echo "error: could not find file exporting registerLinuxConfig in $_main_dir" >&2
    return 1
  fi
  sed -i 's/export{[a-zA-Z0-9_]* as registerLinuxConfig};/const noopFunc=function(){};export{noopFunc as registerLinuxConfig};/' "$_linux_config_file"
}

package() {
  depends+=('hicolor-icon-theme')

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/beeper.desktop" << END
[Desktop Entry]
Type=Application
Name=Beeper
GenericName=Unified Messenger
Comment=$pkgdesc
Exec=beeper --no-sandbox %U
Icon=beepertexts
Terminal=false
StartupWMClass=BeeperTexts
X-AppImage-Version=$pkgver
MimeType=x-scheme-handler/beeper;x-scheme-handler/matrix;x-scheme-handler/element;
Categories=Network;InstantMessaging;
END

  install -Dm644     "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/beepertexts.png"     -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"

  install -Dm644 "$srcdir/squashfs-root/LICENSE.electron.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/squashfs-root/LICENSES.chromium.html" -t "$pkgdir/usr/share/licenses/$pkgname/"

  _package_beeper

  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
