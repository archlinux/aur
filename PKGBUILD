# Maintainer: Serph91P <aur+beeper-bin@users.noreply.github.com>
# Generated-maintenance note: scripts/aur_update.py updates pkgver, source and sha256sums.

_pkgname='beeper'
_install_path='opt'

pkgname='beeper-bin'
pkgver=4.2.927
pkgrel=3
pkgdesc='The ultimate messaging app'
depends=('libappindicator' 'libnotify' 'libsecret' 'hicolor-icon-theme')
url='https://www.beeper.com/beta'
license=('LicenseRef-beeper')
arch=('x86_64')
options=('!strip' '!debug')
conflicts=('beeper' 'beeper-v4-bin')
provides=('beeper')

source=('Beeper-4.2.927-x86_64.AppImage::https://beeper-desktop.download.beeper.com/builds/Beeper-Nightly-4.2.927-x86_64.AppImage')
sha256sums=('8cc8d00c258f49000d037c9dda0aff05016eaa9f9c07b7f8354d909b6f8905fa')

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

  local _app_dir="$pkgdir/$_install_path/beeper/resources/app"
  local _main_dir="$_app_dir/build/main"
  local _linux_config_file
  local _main_mjs_files
  local _oldnull

  _linux_config_file=""

  if [ -d "$_main_dir" ]; then
    _oldnull=$(shopt -p nullglob)
    shopt -s nullglob
    _main_mjs_files=("$_main_dir"/*.mjs)
    eval "$_oldnull"

    if [ -n "${_main_mjs_files[*]}" ]; then
      _linux_config_file=$(grep -lE 'export\{[a-zA-Z0-9_]+ as registerLinuxConfig\};' "${_main_mjs_files[@]}" 2>/dev/null | head -n1)
    fi
  fi

  if [ -z "$_linux_config_file" ] && [ -d "$_app_dir" ]; then
    _linux_config_file=$(grep -R -lE 'export\{[a-zA-Z0-9_]+ as registerLinuxConfig\};' "$_app_dir" --include='*.mjs' 2>/dev/null | head -n1)
  fi

  if [ -z "$_linux_config_file" ]; then
    echo "warning: could not find file exporting registerLinuxConfig in $_app_dir; skipping patch" >&2
    return 0
  fi

  sed -i 's/export{[a-zA-Z0-9_]* as registerLinuxConfig};/const noopFunc=function(){};export{noopFunc as registerLinuxConfig};/' "$_linux_config_file"
}

package() {
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
