# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: lsf
# Contributor: Daniel Haß <aur@hass.onl>
pkgname=standardnotes-desktop
pkgver=3.178.18
pkgrel=1
_nodeversion=16
_electronversion=25
pkgdesc="An end-to-end encrypted notes app for digitalists and professionals."
arch=('x86_64' 'aarch64')
url="https://standardnotes.com"
license=('GPL3')
depends=("electron${_electronversion}" 'libsecret')
makedepends=('git' 'libxcrypt-compat' 'nvm' 'python' 'yarn')
source=("standardnotes-$pkgver.tar.gz::https://github.com/standardnotes/app/archive/refs/tags/@standardnotes/desktop@${pkgver}.tar.gz"
        "standard-notes.desktop"
        "standard-notes.sh")
sha256sums=('009894477244897e1bbbd4a239d8db490735be81dff793bd806d2d157ec994f2'
            '274cd3914ff2a6a0999485a26cbded3ad597763482a90eee8ee34490ddffda00'
            '340c01f232b7d4bbf3778e66666c78567bf61ef71a3db4a0d8d00d83565be1a3')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "app--$pkgname-$pkgver"
  _ensure_local_nvm
  nvm install "$_nodeversion"
}

build() {
  cd "app--$pkgname-$pkgver"
  export YARN_CACHE_FOLDER=.yarn/cache
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  _ensure_local_nvm
  yarn install --immutable
  yarn build:desktop

  cd packages/desktop
  yarn run webpack --config desktop.webpack.prod.js --env deb
  yarn run electron-builder --linux -c.linux.target=deb \
    ${dist} -c.electronDist=${electronDist} -c.electronVersion=${electronVer} \
    --publish=never --c.extraMetadata.version=${pkgver}
}

package() {
  cd "app--$pkgname-$pkgver/packages/desktop"

  if [ "$CARCH" == "aarch64" ]; then
    install -Dm644 dist/linux-arm64-unpacked/resources/app.asar -t \
      "$pkgdir/usr/lib/standard-notes/resources/"
  else
    install -Dm644 dist/linux-unpacked/resources/app.asar -t \
      "$pkgdir/usr/lib/standard-notes/resources/"
  fi

  for icon_size in 16x16 32x32 128x128 256x256 512x512; do
    install -Dm644 build/icon.iconset/icon_${icon_size}.png \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}/apps/standard-notes.png"
    install -Dm644 build/icon.iconset/icon_${icon_size}@2x.png \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}@2x/apps/standard-notes.png"
  done

  install -Dm755 "$srcdir/standard-notes.sh" "$pkgdir/usr/bin/standard-notes"
  install -Dm644 "$srcdir/standard-notes.desktop" -t "$pkgdir/usr/share/applications/"
}
