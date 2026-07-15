# Maintainer: Arnaud Gissinger (contact: mathix.dev)

## options
: ${_autoupdate:=true}

: ${_install_path:=opt}

: ${_pkgtype=-v4-bin}

# basic info
_pkgname='beeper'
pkgname="$_pkgname${_pkgtype:-}"
pkgver=4.2.985
pkgrel=1
pkgdesc="The ultimate messaging app"
depends=(libappindicator-gtk3 libnotify libsecret hicolor-icon-theme)
makedepends=(asar)
url="https://www.beeper.com/beta"
license=('LicenseRef-beeper')
arch=('x86_64')

options=('!strip' '!debug')

_source_main() {
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  source=("$_filename"::"$_dl_url")
  sha256sums=('SKIP')
}

pkgver() {
  printf '%s' "${_pkgver:?}"
}

build() {
  # extract appimage
  chmod +x "$_filename"
  "$srcdir/$_filename" --appimage-extract

  # fix apprun script
  sed -Ei \
    's@^(if \[ -z \"\$APPDIR\" ] ; then)$@APPDIR="/'"$_install_path"'/beeper"\n\1@' \
    "$srcdir/squashfs-root/AppRun"
}

_package_beeper() {
  # apprun script
  install -Dm755 "$srcdir/squashfs-root/AppRun" "$pkgdir/usr/bin/beeper"

  # The app source is now packed into an asar archive (resources/app.asar) with
  # native modules kept in resources/app.asar.unpacked. To patch the source we
  # extract the archive, edit it, then repack preserving the same unpacked set.
  local _app_dir="$srcdir/squashfs-root/resources"
  local _asar_file="$_app_dir/app.asar"
  local _extract_dir="$srcdir/app.asar.extracted"
  # exact list of currently-unpacked files, used as the repack --unpack glob
  local _unpacked_files_glob
  _unpacked_files_glob="{$(cd "$_asar_file.unpacked" && find . -type f | sed -E 's,^\./,,' | paste -s -d, -)}"
  asar extract "$_asar_file" "$_extract_dir"

  # replace registerLinuxConfig function
  # Find the file that exports registerLinuxConfig and replace the export statement.
  # The upstream filename has changed across versions (e.g. linux-*.mjs, main-entry-*.mjs),
  # so locate it by content instead of hardcoding the name.
  local _main_dir="$_extract_dir/build/main"
  local _linux_config_file
  _linux_config_file=$(grep -lE 'export\{[a-zA-Z0-9_]+ as registerLinuxConfig\};' "$_main_dir"/*.mjs | head -n1)
  if [ -z "$_linux_config_file" ]; then
    echo "error: could not find file exporting registerLinuxConfig in $_main_dir" >&2
    return 1
  fi
  sed -i 's/export{[a-zA-Z0-9_]* as registerLinuxConfig};/const noopFunc=function(){};export{noopFunc as registerLinuxConfig};/' "$_linux_config_file"

  # repack into a new asar, unpacking the same files as the original
  asar pack --unpack "$_extract_dir/$_unpacked_files_glob" "$_extract_dir" "$srcdir/app.asar"
  # sanity-check: repacked unpacked files must be byte-identical to the originals.
  # We keep the original app.asar.unpacked dir (extraction drops the executable
  # bit on native binaries), so only the app.asar archive itself is replaced.
  # null-delimited so filenames with spaces (e.g. "Beeper Squared.png") survive
  local _fp
  while IFS= read -r -d '' _fp; do
    cmp "$_app_dir/app.asar.unpacked/$_fp" "$srcdir/app.asar.unpacked/$_fp" || return 1
  done < <(cd "$_app_dir/app.asar.unpacked" && find . -type f -print0)
  mv -Tf "$srcdir/app.asar" "$_asar_file"

  # everything else
  install -dm755 "$pkgdir/$_install_path"
  mv "$srcdir/squashfs-root" "$pkgdir/$_install_path/beeper"

  # remove default .desktop file
  rm -f "$pkgdir/$_install_path/beeper/beepertexts.desktop"
}

package() {
  depends+=('hicolor-icon-theme')

  # Window class the app actually uses at runtime, so launchers and Wayland
  # compositors (e.g. sway) can map the window to this entry and its icon.
  # Upstream declares it in its bundled .desktop (currently "Beeper"); read it
  # from there so we stay correct if it changes, falling back to "Beeper".
  local _wmclass
  _wmclass=$(sed -nE 's/^StartupWMClass=(.+)$/\1/p' "$srcdir/squashfs-root/beepertexts.desktop" | head -n1)
  : "${_wmclass:=Beeper}"

  # desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/beeper.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
GenericName=Unified Messenger
Comment=$pkgdesc
Exec=$_pkgname --no-sandbox %U
Icon=beepertexts
Terminal=false
StartupWMClass=$_wmclass
X-AppImage-Version=$pkgver
MimeType=x-scheme-handler/beeper;x-scheme-handler/matrix;x-scheme-handler/element;
Categories=Network;InstantMessaging;
END

  # icon
  install -Dm644 \
    "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/beepertexts.png" \
    -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"

  # license files
  install -Dm644 "$srcdir/squashfs-root/LICENSE.electron.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/squashfs-root/LICENSES.chromium.html" -t "$pkgdir/usr/share/licenses/$pkgname/"

  _package_beeper

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}

_update_version() {
  : ${_pkgver:=$pkgver}

  if [[ "${_autoupdate::1}" != 't' ]]; then
    return
  fi

  _dl_url="https://api.beeper.com/desktop/download/linux/x64/stable/com.automattic.beeper.desktop"

  _filename=$(
    curl -v -L --no-progress-meter -r 0-1 "$_dl_url" 2>&1 > /dev/null \
      | grep "GET /builds/" \
      | sed -E 's@^.*GET /builds/([^ ]+) HTTP/2.*$@\1@'
  )

  _pkgver_new=$(
    printf '%s' "$_filename" \
      | sed -E 's@^Beeper-([0-9]+\.[0-9]+\.[0-9]+)(.*)?.AppImage$@\1@'
  )

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ]; then
    _pkgver="$_pkgver_new"
  fi
}

_update_version
_source_main
