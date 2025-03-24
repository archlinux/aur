# Maintainer: Patrik Sundberg <patrik.sundberg@gmail.com>

## options
: ${_system_electron:=true}
: ${_install_path:=opt}

: ${_pkgtype=-latest-bin}

_pkgname='beeper'
pkgname="$_pkgname${_pkgtype:-}"
pkgver=4.0.551
pkgrel=1
pkgdesc="A unified messaging app"
url="https://beeper.com/"
license=('LicenseRef-beeper')

if [[ "${_system_electron::1}" == "t" ]]; then
  arch=('any')
else
  arch=('x86_64')
fi

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

  # everything else
  install -dm755 "$pkgdir/$_install_path"
  mv "$srcdir/squashfs-root" "$pkgdir/$_install_path/beeper"
}

_package_asar() {
  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env bash

name=$_pkgname
flags_file="\${XDG_CONFIG_HOME:-\$HOME/.config}/\${name}-flags.conf"

lines=()
if [[ -f "\${flags_file}" ]]; then
  mapfile -t lines < "\${flags_file}"
fi

flags=()
for line in "\${lines[@]}"; do
  if [[ ! "\${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "\${line}" ]]; then
    flags+=("\${line}")
  fi
done

: \${ELECTRON_IS_DEV:=0}
export ELECTRON_IS_DEV
: \${ELECTRON_FORCE_IS_PACKAGED:=true}
export ELECTRON_FORCE_IS_PACKAGED

if [ -e "/${_install_path}/\${name}/resources/app.asar" ]; then
  ASAR="/${_install_path}/\${name}/resources/app.asar"
else
  ASAR="/${_install_path}/\${name}/resources/app"
fi

exec electron${_electron_version:-} "\$ASAR" "\${flags[@]}" "\$@"
END

  # app.asar (maybe)
  install -dm755 "$pkgdir/$_install_path/$_pkgname"/resources
  mv "$srcdir"/squashfs-root/resources/* "$pkgdir/$_install_path/$_pkgname"/resources/
}

package() {
  # desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/beeper.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
GenericName=Unified Messenger
Comment=$pkgdesc
Exec=$_pkgname %U
Icon=$_pkgname
Terminal=false
StartupWMClass=Beeper
Categories=Utility;
END

  # icon
  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/beepertexts.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # license files
  install -Dm644 "$srcdir/squashfs-root/LICENSE.electron.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/squashfs-root/LICENSES.chromium.html" -t "$pkgdir/usr/share/licenses/$pkgname/"

  # program files
  if [[ "${_system_electron::1}" == "t" ]]; then
    _electron_version=$(
      strings "$srcdir/squashfs-root/beepertexts" \
        | grep -Eom1 'Electron/\S+' \
        | sed -E 's&^Electron/([0-9]+)\.[0-9\.]+$&\1&'
    )
    depends+=("electron${_electron_version:-}")
    _package_asar
  else
    _package_beeper
  fi

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}

_update_version() {
  : ${_pkgver:=$pkgver}

  local _tmp_url="https://api.beeper.com/desktop/download/linux/x64/stable/com.automattic.beeper.desktop"

  _dl_url=$(
    curl -v --no-progress-meter -r 0-1 "$_tmp_url" 2>&1 > /dev/null \
      | grep location \
      | sed -E 's@^.*\blocation:\s*(\S+).*$@\1@'
  )

  _filename="${_dl_url##*/}"

  _pkgver_new=$(
    printf '%s' "$_filename" \
      | sed -E 's@^\S+-([0-9]+\.[0-9]+\.[0-9]+)(.*)?\.AppImage$@\1@'
  )

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ]; then
    _pkgver="$_pkgver_new"
  fi
}

_update_version
_source_main
