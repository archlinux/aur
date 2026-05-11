# Maintainer: aur.chaotic.cx
# Contributor: samsapti <sam at sapti dot me>
# Contributor: lsf
# Contributer: Sam Whited <sam@samwhited.com>

: ${_install_path:=usr/lib}

_pkgname="jitsi-meet-desktop"
pkgname="$_pkgname"
pkgver=2026.5.0
pkgrel=1
pkgdesc="Jitsi Meet desktop application"
url="https://github.com/jitsi/jitsi-meet-electron"
license=('Apache-2.0')
arch=('x86_64')

depends=(
  'electron'
)
makedepends=(
  'jq'
  'npm'
)

_pkgsrc="jitsi-meet-electron-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('1ab2e5c01bdb70be917c7573fc8b31d6f37c7d0a9df576574994103006d529a4')

prepare() (
  cd "$_pkgsrc"

  # fix links
  sed -E -e 's#git+ssh://git@github.com#git+https://github.com#g' \
    -i package-lock.json

  # remove targets
  local _package=$(cat package.json)
  echo "$_package" \
    | jq 'del(.build.mac, .build.mas, .build.deb, .build.win)' \
    | jq '.build.linux.target = "dir"' \
      > package.json

  jq '.build.files = (["!node_modules/fsevents"] + (.build.files // []))' package.json \
    > package.tmp && mv package.tmp package.json

  # disable updater
  sed -E -e '/autoUpdater/d' -i main.js
)

build() (
  # avoid cluttering user home
  export HOME="$srcdir/tmp_home"
  export XDG_CACHE_HOME="$srcdir/tmp_cache"
  export XDG_CONFIG_HOME="$srcdir/tmp_config"
  export XDG_DATA_HOME="$srcdir/tmp_data"
  export XDG_STATE_HOME="$srcdir/tmp_state"

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  local _electron_version=$(cat /usr/lib/electron/version)

  local _electron_builder_options=(
    --linux dir
    --publish never
    -c.electronDist="/usr/lib/electron${_electron_version%%.*}"
    -c.electronVersion="$_electron_version"
  )

  cd "$_pkgsrc"

  sed -E \
    -e 's#("electron"): "[^"]+",#\1: "'${_electron_version}'",#' \
    -i package.json package-lock.json

  npm install --no-audit --no-fund --ignore-scripts

  npm ls fsevents || true
  rm -rf node_modules/fsevents
  mkdir -p node_modules/fsevents

  npm exec -c 'webpack --config ./webpack.main.js'
  npm exec -c 'webpack --config ./webpack.renderer.js'
  npm exec -c "electron-builder ${_electron_builder_options[*]}"
)

package() {
  local _electron_version=$(cat /usr/lib/electron/version)
  depends=("electron${_electron_version%%.*}")

  # asar
  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname/"
  cp -r "$_pkgsrc/dist/linux-unpacked/resources"/* "$pkgdir/$_install_path/$_pkgname/"

  # remove unused sources and prebuilds
  find "$pkgdir/$_install_path/$_pkgname/app.asar.unpacked/node_modules" \
    -type d -path "*/src" -exec rm -rf {} +

  find "$pkgdir/$_install_path/$_pkgname/app.asar.unpacked/node_modules" \
    -type d -path "*/prebuilds/*" \
    ! -path "*/linux-x64" \
    ! -path "*/linux-arm64" \
    -exec rm -rf {} +

  # icon
  install -Dm644 "$_pkgsrc/resources/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Jitsi Meet
Comment=Jitsi Meet Desktop App
Exec=$_pkgname %U
Icon=$_pkgname
Terminal=false
MimeType=x-scheme-handler/jitsi-meet;
StartupWMClass=Jitsi Meet
Categories=VideoConference;AudioVideo;Audio;Video;Network;
END

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

exec electron${_electron_version%%.*} "/$_install_path/\${name}/app.asar" "\${flags[@]}" "\$@"
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
