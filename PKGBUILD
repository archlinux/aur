# Maintainer: ezhkov <alexcez94@gmail.com>
pkgname=voltius
pkgver=0.24.0
pkgrel=1
pkgdesc="Local-first SSH/SFTP/Serial client with E2EE sync, plugins, and no account required"
arch=('x86_64' 'aarch64')
url="https://github.com/VoltiusApp/voltius"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsecret' 'hicolor-icon-theme')
makedepends=('rust' 'nodejs' 'npm' 'git' 'appmenu-gtk-module' 'desktop-file-utils')
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/VoltiusApp/voltius/archive/refs/tags/v$pkgver.tar.gz"
  "$pkgname.desktop"
)
sha256sums=('943bcd671aa0ae2fad8c50c58069f133937225beb00dc7218e746aa19e1d34b7'
            '101c1683674e94e286f06627f76d0422e506afd2579620d202710bd304693f44')

prepare() {
  cd "voltius-$pkgver"
  # pnpm isn't in the official repos; install it into a local, writable
  # prefix rather than relying on `corepack enable` (which tries to write
  # shims next to the system-wide nodejs install under /usr).
  npm install -g pnpm@10.34.5 --prefix "$srcdir/npm-global"
}

build() {
  cd "voltius-$pkgver"
  export PATH="$srcdir/npm-global/bin:$PATH"
  export TAURI_SIGNING_PRIVATE_KEY="aur-build-dummy-key"
  export TAURI_SIGNING_PRIVATE_KEY_PASSWORD="aur-build-dummy-pass"
  export NODE_ENV=production
  pnpm install --frozen-lockfile
  pnpm tauri build --no-bundle
}

package() {
  cd "voltius-$pkgver"

  install -Dm755 target/release/voltius "$pkgdir/usr/bin/voltius"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
