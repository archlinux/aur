# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=materialious
_app_id=us.materialio.Materialious
pkgver=1.11.5
pkgrel=1
_nodeversion=22
_electronversion=39
pkgdesc="Modern material design for Invidious."
arch=('x86_64')
url="https://materialio.us"
license=('AGPL-3.0-or-later')
depends=("electron${_electronversion}")
makedepends=(
  'desktop-file-utils'
  'nvm'
  'python'
)
source=("Materialious-$pkgver.tar.gz::https://github.com/Materialious/Materialious/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('690c50d06fae6280c4f78f117fb53080f5eb4f16d71fce5731d35253fb46c883'
            'ae23af6865ab1638d46df5158fa09d41357f57068f1676af86e1a0e6e00459ed')

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
  cd "Materialious-$pkgver/$pkgname/electron"
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  # Set desktop file Exec
  desktop-file-edit --set-key=Exec --set-value="$pkgname" "$pkgname.desktop"

  # Set Electron version
  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/$pkgname.sh"
}

build() {
  cd "Materialious-$pkgver/$pkgname"
  export npm_config_cache="$srcdir/npm_cache"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
   _ensure_local_nvm
  npm install
  npm run build
  npx cap telemetry off
  npx cap sync @capacitor-community/electron

  cd electron
  python patch_capacitor_plugin.py
  npm install
  npm run build
  npx electron-builder build --linux dir -c ./electron-builder.config.json \
    -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "Materialious-$pkgver/$pkgname/electron"
  install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 assets/appIcon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_app_id}.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "$pkgname.metainfo.xml" "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
