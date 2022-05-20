# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=youtube-music
pkgver=1.17.0
pkgrel=1
pkgdesc="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
arch=('x86_64')
url="https://th-ch.github.io/youtube-music"
license=('MIT')
depends=('electron' 'libsecret')
makedepends=('git' 'nodejs>=14.0.0' 'npm' 'yarn')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
source=("$pkgname-$pkgver.tar.gz::https://github.com/th-ch/youtube-music/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('6866f508dca5c5a0e0fdaa4e46c84eb85c7ddce55493ad71b894cf5afaae21fd'
            'a1d30cedc17ede48b7d627a3797a0918b7bd3c9062e9ed83d61f153c001c1ef8'
            '07af59376e13e5dae2e7e38fa09d734a5147d5c344b3aed84c2f3afe22b8af79')

build() {
  cd "$pkgname-$pkgver"
  electronDist=/usr/lib/electron
  electronVer=$(sed s/^v// /usr/lib/electron/version)
  yarn config set cache-folder "$srcdir/yarn-cache"
  yarn install
  yarn run clean
  HOME="$srcdir/.electron-gyp" ./node_modules/.bin/electron-builder --linux dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 license -t "$pkgdir/usr/share/licenses/$pkgname"

  for icon_size in 16 24 32 48 64 128 256 512 1024; do
    icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -Dm644 assets/generated/icons/png/${icon_size}x${icon_size}.png \
      $pkgdir$icons_dir/$pkgname.png
  done
}
