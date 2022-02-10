# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gmail-desktop
_pkgver=3.0.0-alpha.30
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unofficial Gmail desktop app"
arch=('x86_64')
url="https://github.com/timche/gmail-desktop"
license=('MIT')
depends=('electron15')
makedepends=('yarn')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('f69a3e4afacb164b6e64c11f5c8379e74cd0822ae487fea7bfdff7713b6fb8d4'
            '73ecbbf5025251fb057557cf316c8fc39fb99047fb1a2d5e7f26ad83180d9877'
            '8c30e207fe88455f63f4c0b2ae9087a2ca2bbeaa68b9be244c31a9ec392373c4')

prepare() {
  cd "$pkgname-$_pkgver"

  # Disable husky
  sed -i '/husky/d' package.json
}

build() {
  cd "$pkgname-$_pkgver"
  electronDist="/usr/lib/electron"
  electronVer="$(sed s/^v// /usr/lib/electron/version)"
  yarn config set cache-folder "$srcdir/yarn-cache"
  yarn install
  yarn build
  ./node_modules/.bin/electron-builder --linux --x64 --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$pkgname-$_pkgver"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r --no-preserve=ownership dist/linux-unpacked/resources \
    "$pkgdir/usr/lib/$pkgname"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
