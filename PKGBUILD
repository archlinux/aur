# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ytmdesktop
pkgver=1.14.2
pkgrel=1
_electronversion=17
_nodeversion=12
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.app"
license=('CC0-1.0')
depends=("electron${_electronversion}")
makedepends=('git' 'nvm' 'python' 'yarn')
optdepends=('libnotify: for desktop notifications'
            'libappindicator-gtk3: for tray icon'
            'nss-mdns: for companion server')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytmdesktop/ytmdesktop/archive/$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('78ef6a6e9d7b878a284a4f43227ff9cc52ba424c4d6ee699268d9c80f9a5c97f'
            'eedee6478d28d182aff196a66a4a8d4a771f576f924a9a7b0dd836f62e079453'
            '3ed0c519e62483bb411e258df6d100463b8a417930ea67b34844bde8464e143d')

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
  cd "$pkgname-$pkgver"
  _ensure_local_nvm
  nvm install "$_nodeversion"
}

build() {
  cd "$pkgname-$pkgver"
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  _ensure_local_nvm
  yarn config set cache-folder "$srcdir/yarn-cache"
  yarn --frozen-lockfile
  ./node_modules/.bin/electron-builder --linux --dir -p always --config electron-builder64.yml \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  for icon_size in 16 256 512; do
    icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -d $pkgdir/$icons_dir
    install -m644 src/assets/favicon.${icon_size}x${icon_size}.png \
      $pkgdir/$icons_dir/$pkgname.png
  done

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications"
}
