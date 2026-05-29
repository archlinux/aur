# Maintainer: sz0msz3dvagy0k

pkgname=sz0mtify
pkgver=0.1.0
pkgrel=1
pkgdesc='Self-hosted music analytics and listening companion for Subsonic/Navidrome libraries'
arch=('x86_64')
url='https://github.com/Sz0msz3dvagy0k/sz0mtify-dashboard'
license=('MIT')
depends=('gtk3' 'hicolor-icon-theme' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'npm' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

_srcname="sz0mtify-dashboard-$pkgver"

prepare() {
  cd "$srcdir/$_srcname/frontend"

  export npm_config_audit=false
  export npm_config_cache="$srcdir/npm-cache"
  export npm_config_fund=false
  export npm_config_update_notifier=false

  npm ci
}

build() {
  cd "$srcdir/$_srcname/frontend"

  export npm_config_audit=false
  export npm_config_cache="$srcdir/npm-cache"
  export npm_config_fund=false
  export npm_config_update_notifier=false

  npm run tauri build -- --no-bundle
}

package() {
  cd "$srcdir/$_srcname"

  install -Dm755 "frontend/src-tauri/target/release/app" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "frontend/src-tauri/icons/32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"

  install -Dm644 "frontend/src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

  install -Dm644 "frontend/src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<DESKTOP
[Desktop Entry]
Name=sz0mtify
Comment=Self-hosted music analytics and listening companion
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Audio;AudioVideo;Player;
StartupWMClass=app
DESKTOP
}
