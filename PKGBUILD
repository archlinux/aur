# Maintainer:
# Contributor: samsapti <sam at sapti dot me>
# Contributor: lsf
# Contributer: Sam Whited <sam@samwhited.com>

## links
# https://jitsi.org/jitsi-meet/
# https://github.com/jitsi/jitsi-meet-electron

## options
: ${_nodeversion:=18}
: ${_install_path:=usr/share}

: ${_electron_dist:=/usr/lib/electron}

_pkgname="jitsi-meet-desktop"
pkgname="$_pkgname"
pkgver=2025.1.0
pkgrel=1
pkgdesc="Jitsi Meet desktop application"
url="https://github.com/jitsi/jitsi-meet-electron"
license=('Apache-2.0')
arch=('any')

depends=(
  'electron'
)
makedepends=(
  'npm'
)

_pkgsrc="jitsi-meet-electron-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"$url/archive/v$pkgver.$_pkgext"
  'no_targets.patch'
)
sha256sums=(
  'abc812361523aa2b43706577d159c211941c1d18a59c868cf0b412eb3d2f2d43'
  'ed3a4d4c524611ba66c9f0e28d2da77cb2948c6785367d69b86aa4965dd6bb99'
)

prepare() (
  cd "$_pkgsrc"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
      echo
    fi
  done

  sed -E -e 's#git+ssh://git@github.com#git+https://github.com#g' \
    -i package-lock.json
)

build() (
  export npm_config_cache="$srcdir/npm_cache"
  export NODE_ENV=production

  cd "$_pkgsrc"
  NODE_ENV=development npm install --no-audit --no-fund

  npm exec -c 'webpack --config ./webpack.main.js'
  npm exec -c 'webpack --config ./webpack.renderer.js'
  npm exec -c "electron-builder --linux --dir -c.electronDist=$_electron_dist -c.electronVersion=$(cat $_electron_dist/version)"
)

package() (
  install -Dm644 "$_pkgsrc/dist/linux-unpacked/resources/app.asar" -t "$pkgdir/$_install_path/$_pkgname/"
  install -Dm644 "$_pkgsrc/resources/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

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

exec electron "/$_install_path/$_pkgname/app.asar" "\${flags[@]}" "\$@"
END
)
