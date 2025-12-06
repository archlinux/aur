
# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: lsf
# Contributor: Daniel Haß <aur@hass.onl>

pkgname=standardnotes-desktop
pkgver=3.201.4
pkgrel=1
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
  'libxcrypt-compat'
  'python'
  'python-setuptools'
  'yarn'
)
options=('!strip')
source=("standardnotes-$pkgver.tar.gz::https://github.com/standardnotes/app/archive/refs/tags/@standardnotes/desktop@${pkgver}.tar.gz"
        "standard-notes.desktop"
        "standard-notes.sh")
sha256sums=('fbb1fd19e2ea263a3526678ecc6415df3c4692633137d6c1d1501c8d4e0e7578'
            '274cd3914ff2a6a0999485a26cbded3ad597763482a90eee8ee34490ddffda00'
            '3ef9a5d2b4f2ba2e5b210a492c7398073f3cdd472d989e5ce2d4c6105d905666')

_srcdir="app--${pkgname}-${pkgver}"

prepare() {
  cd "$_srcdir"
  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/standard-notes.sh"
}

build() {
  cd "$_srcdir"
  
  export YARN_CACHE_FOLDER=.yarn/cache
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  
  local electronDist="/usr/lib/electron${_electronversion}"
  local electronVer="$(<"${electronDist}/version")"
  electronVer="${electronVer#v}"  # Strip leading 'v' if present
  
  yarn config set --home enableTelemetry 0
  yarn install --immutable
  yarn workspace @standardnotes/desktop rebuild:home-server
  yarn build:desktop
  yarn workspace @standardnotes/desktop webpack --config desktop.webpack.prod.js --env deb
  yarn workspace @standardnotes/desktop electron-builder --linux -c.linux.target=deb \
    -c.electronDist="${electronDist}" -c.electronVersion="${electronVer}" \
    --publish=never -c.extraMetadata.version="${pkgver}"
}

package() {
  cd "${_srcdir}/packages/desktop"

  # Determine architecture-specific path
  local _distdir
  case "$CARCH" in
    aarch64) _distdir="dist/linux-arm64-unpacked" ;;
    *)       _distdir="dist/linux-unpacked" ;;
  esac

  install -Dm644 "${_distdir}/resources/app.asar" -t "$pkgdir/usr/lib/standard-notes/"

  # Install icons
  local size
  for size in 16x16 32x32 128x128 256x256 512x512; do
    install -Dm644 "build/icon.iconset/icon_${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}/apps/standard-notes.png"
    install -Dm644 "build/icon.iconset/icon_${size}@2x.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}@2x/apps/standard-notes.png"
  done

  install -Dm755 "$srcdir/standard-notes.sh" "$pkgdir/usr/bin/standard-notes"
  install -Dm644 "$srcdir/standard-notes.desktop" -t "$pkgdir/usr/share/applications/"
}
