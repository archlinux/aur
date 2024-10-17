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

_pkgname="jitsi-meet-desktop"
pkgname="$_pkgname"
pkgver=2024.10.0
pkgrel=1
pkgdesc="Jitsi Meet desktop application"
url="https://github.com/jitsi/jitsi-meet-electron"
license=('Apache-2.0')
arch=('any')

depends=(
  'electron'
)
makedepends=(
  'nvm' # AUR
)

options=('!strip')

_pkgsrc="jitsi-meet-electron-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"$url/archive/v$pkgver.$_pkgext"
  'no_targets.patch'
)
sha256sums=(
  'ce82b7b92bc56aff7916c8a123737dbddd7ae0faff2b3d25ae77523aa85c7514'
  'ed3a4d4c524611ba66c9f0e28d2da77cb2948c6785367d69b86aa4965dd6bb99'
)

_nvm_env() {
  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"

  export npm_config_cache="${srcdir}/npm_cache"

  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion

  _electron_dist="/usr/lib/electron"
  _electron_ver=$(cat $_electron_dist/version)
}

prepare() {
  _nvm_env

  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done

  sed -E -e 's&"electron": "[^"]+",&"electron": "^'$_electron_ver'",&' \
    -e 's#git+ssh://git@github.com#git+https://github.com#g' \
    -i package-lock.json
}

build() (
  _nvm_env

  cd "$_pkgsrc"

  npm install

  # npm run build
  npm exec -c 'webpack --config ./webpack.main.js --mode production'
  npm exec -c 'webpack --config ./webpack.renderer.js --mode production'
  npm exec -c "electron-builder --linux --dir -c.electronDist=$_electron_dist -c.electronVersion=$_electron_ver"
)

package() (
  cd "$_pkgsrc"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/$_install_path/$_pkgname"
  cp -r "dist/linux-unpacked"/resources/* "$pkgdir/$_install_path/$_pkgname"

  install -Dm644 -- resources/icon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
NODE_ENV=production ELECTRON_IS_DEV=false exec electron /$_install_path/$_pkgname/app.asar "\$@"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Name=Jitsi Meet
Comment=Jitsi Meet Desktop App
Exec=$_pkgname %U
Icon=$_pkgname
Type=Application
Terminal=false
MimeType=x-scheme-handler/jitsi-meet;
StartupWMClass=Jitsi Meet
Categories=VideoConference;AudioVideo;Audio;Video;Network;
END
)
