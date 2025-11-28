# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: lsf
# Contributor: Daniel Haß <aur@hass.onl>

pkgname=standardnotes-desktop
pkgver=3.198.5
pkgrel=2
_electronversion=35
pkgdesc="Think fearlessly with end-to-end encrypted notes and files."
arch=('x86_64' 'aarch64')
url="https://standardnotes.com"
license=('GPL-3.0-or-later')
depends=(
  "electron${_electronversion}"
  'libsecret'
)
makedepends=(
  'git'
  'libxcrypt-compat'
  'python'
  'python-setuptools'
  'yarn'
)
source=("standardnotes-$pkgver.tar.gz::https://github.com/standardnotes/app/archive/refs/tags/@standardnotes/desktop@${pkgver}.tar.gz"
        "standard-notes.desktop"
        "standard-notes.sh")
sha256sums=('9de0b04d364ad0e3a086c52178c3416fe55d91962bf64b6bcd73ec8abbba758a'
            '274cd3914ff2a6a0999485a26cbded3ad597763482a90eee8ee34490ddffda00'
            '3ef9a5d2b4f2ba2e5b210a492c7398073f3cdd472d989e5ce2d4c6105d905666')

prepare() {
  cd "app--$pkgname-$pkgver"
  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/standard-notes.sh"
}

build() {
  cd "app--$pkgname-$pkgver"
  export YARN_CACHE_FOLDER=.yarn/cache
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  yarn config set --home enableTelemetry 0
  yarn install --immutable
  yarn workspace @standardnotes/desktop rebuild:home-server
  yarn build:desktop
  yarn workspace @standardnotes/desktop webpack --config desktop.webpack.prod.js --env deb
  yarn workspace @standardnotes/desktop electron-builder --linux -c.linux.target=deb \
    ${dist} -c.electronDist=${electronDist} -c.electronVersion=${electronVer} \
    --publish=never --c.extraMetadata.version=${pkgver}
}

package() {
  cd "app--$pkgname-$pkgver/packages/desktop"

  if [ "$CARCH" == "aarch64" ]; then
    install -Dm644 dist/linux-arm64-unpacked/resources/app.asar -t \
      "$pkgdir/usr/lib/standard-notes/"
  else
    install -Dm644 dist/linux-unpacked/resources/app.asar -t \
      "$pkgdir/usr/lib/standard-notes/"
  fi

  for i in 16x16 32x32 128x128 256x256 512x512; do
    install -Dm644 "build/icon.iconset/icon_${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}/apps/standard-notes.png"
    install -Dm644 "build/icon.iconset/icon_${i}@2x.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}@2x/apps/standard-notes.png"
  done

  install -Dm755 "$srcdir/standard-notes.sh" "$pkgdir/usr/bin/standard-notes"
  install -Dm644 "$srcdir/standard-notes.desktop" -t "$pkgdir/usr/share/applications/"
}
