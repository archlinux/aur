# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: lsf
# Contributor: Daniel Haß <aur@hass.onl>
pkgname=standardnotes-desktop
pkgver=3.151.3
pkgrel=1
_electronversion=22
pkgdesc="An end-to-end encrypted notes app for digitalists and professionals."
arch=('x86_64' 'aarch64')
url="https://standardnotes.com"
license=('GPL3')
depends=("electron${_electronversion}" 'libsecret')
makedepends=('libxcrypt-compat' 'nvm' 'yarn')
source=("standardnotes-$pkgver.tar.gz::https://github.com/standardnotes/app/archive/refs/tags/@standardnotes/desktop@${pkgver}.tar.gz"
        "standard-notes.desktop"
        "standard-notes.sh")
sha256sums=('7ec487b699c373eb6850fdd8c88b7c55d461efd8deb5ae52f1664edd5d4360ae'
            '274cd3914ff2a6a0999485a26cbded3ad597763482a90eee8ee34490ddffda00'
            '5fa1b6ed3cedfbf233d8e7f34edd7d643d43d7299d19645d098ae6cd2bd3f8d6')

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
  nvm install
}

build() {
  cd "app--$pkgname-$pkgver"
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  if [[ $CARCH == 'aarch64' ]]; then
    export npm_config_target_arch=arm64
    export npm_config_arch=arm64
    export npm_config_host_arch=arm64
  fi

  _ensure_local_nvm
  yarn install
  yarn build:desktop

  cd packages/desktop
  yarn run webpack --config desktop.webpack.prod.js --env deb

  if [ "$CARCH" == "aarch64" ]; then
    yarn run electron-builder --linux --arm64 -c.linux.target=deb \
      ${dist} -c.electronDist=${electronDist} -c.electronVersion=${electronVer} \
      --publish=never --c.extraMetadata.version=${pkgver}
  else
    yarn run electron-builder --linux --x64 -c.linux.target=deb \
      ${dist} -c.electronDist=${electronDist} -c.electronVersion=${electronVer} \
      --publish=never --c.extraMetadata.version=${pkgver}
  fi
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
