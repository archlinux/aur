# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=android-messages-desktop
pkgver=5.3.4
pkgrel=3
_electronversion=20
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
url="https://github.com/OrangeDrangon/android-messages-desktop"
license=('MIT')
depends=("electron${_electronversion}")
makedepends=('git' 'yarn')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('f26a1152acef7d5f8d2cbb385fe7b27ebd39805618dbc69aa31500c446158e02'
            'e7151555e8f57ab7c212aef1cc2312abc796fd6258713158c683eb5e099c7201'
            '1bf16b8864712b0c1de72d8c3764db14b75ecf64dae44d206a26aa036ac53b1a')

build() {
  cd "$pkgname-$pkgver"
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  yarn config set cache-folder "$srcdir/yarn-cache"
  yarn install
  yarn webpack --mode=production
  yarn electron-builder --linux --x64 --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/$pkgname/resources/"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  for icon_size in 16 24 32 48 64 128 256 512 1024; do
    icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -Dm644 resources/icons/${icon_size}x${icon_size}.png \
      $pkgdir$icons_dir/$pkgname.png
  done
}
