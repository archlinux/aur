pkgname=google-assistant-unofficial-desktop-client
_gitname=Google-Assistant-Unofficial-Desktop-Client
_pkgver=1.0.0
pkgver=${_pkgver//-/.}
pkgrel=2
_electronversion=10
_nodeversion=14
pkgdesc="A cross-platform unofficial Google Assistant Client for Desktop (powered by Google Assistant SDK)"
arch=('x86_64')
url="https://github.com/Melvin-Abraham/Google-Assistant-Unofficial-Desktop-Client"
license=('Apache')
depends=("electron${_electronversion}")
makedepends=('nvm')
source=("g-assist-$_pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz"
        "g-assist.desktop"
        "g-assist.png"
        "g-assist.sh"
        )
sha256sums=('f564583425ee1c26ce72c5ddebfbee468b3127976d4df5a3ddff4ec4b2a746ee'
            'd56962ceefe6a87d9a161655549adb56cff6961f142ecb141654cddb7e314cb5'
            '9108d4108fcedf17f4ab421aad4432b9d33598055251cd0119140e4ab3b9e9c5'
            '5e462519de1e1301f224a9fd81af3e9387085cb60e0e5bc848a6d550c2eff9f2')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="$srcdir/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "$_gitname-$_pkgver"
  _ensure_local_nvm
  nvm install "$_nodeversion"
}

build() {
  cd "$_gitname-$_pkgver"
  electronDist="/usr/lib/electron$_electronversion"
  electronVer="$(sed s/^v// /usr/lib/electron$_electronversion/version)"
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  npm install
  ./node_modules/.bin/electron-builder --linux --x64 --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$_gitname-$_pkgver"
  install -d "$pkgdir/usr/lib/g-assist"
  cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/g-assist"

  install -Dm644 "app/res/Assistant Logo.png" "$pkgdir/usr/share/pixmaps/g-assist.png"
  install -Dm644 "app/res/Assistant Logo.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/g-assist.svg"
  install -Dm644 "$srcdir/g-assist.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/g-assist.png" -t "$pkgdir/usr/share/pixmaps"
  install -Dm755 "$srcdir/g-assist.sh" "$pkgdir/usr/bin/g-assist"
}
