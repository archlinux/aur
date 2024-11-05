# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=materialious
pkgver=1.6.22
pkgrel=1
_electronversion=33
pkgdesc="Modern material design for Invidious."
arch=('x86_64')
url="https://materialio.us"
license=('AGPL-3.0-or-later')
depends=(
  "electron${_electronversion}"
)
makedepends=(
  'desktop-file-utils'
  'npm'
  'python'
)
source=("Materialious-$pkgver.tar.gz::https://github.com/Materialious/Materialious/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('5ca22d1d3794b840f573038af11066f77eef044bb93fcca8a876a89fd6560026'
            '2109a2f0353f1cc04e12539f55ed4dbb58d59f4d12e000d86f6668369c224c4c')

prepare() {
  cd "Materialious-$pkgver/$pkgname/electron"

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
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/us.materialio.Materialious.png"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
