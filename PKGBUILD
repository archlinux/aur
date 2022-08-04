# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gmail-desktop
_pkgver=3.0.0-alpha.34
pkgver=${_pkgver//-/.}
pkgrel=4
_electronversion=20
pkgdesc="Unofficial Gmail desktop app"
arch=('x86_64')
url="https://github.com/timche/gmail-desktop"
license=('MIT')
depends=("electron${_electronversion}")
makedepends=('yarn')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('d9fcc89e79b1ad5ee091adef8c6ff4284583db09c3e18e7284fe8c57a5d0e2cf'
            'b3b54bafd3d986492a29f6200abe8857f877a7bdb27f3db02578bd43bc9ba131'
            '8c30e207fe88455f63f4c0b2ae9087a2ca2bbeaa68b9be244c31a9ec392373c4')

prepare() {
  cd "$pkgname-$_pkgver"

  # Disable husky
  sed -i '/husky/d' package.json

  # yarn.lock is used
  rm -f package-lock.json
}

build() {
  cd "$pkgname-$_pkgver"
  electronDist="/usr/lib/electron$_electronversion"
  electronVer="$(sed s/^v// /usr/lib/electron$_electronversion/version)"
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
