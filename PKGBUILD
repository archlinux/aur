# Maintainer: Jonathan Bangert <jonathan@bangert.dk>
pkgname='music-assistant-desktop'
pkgver=0.0.31
pkgrel=1
pkgdesc="Music Assistant Companion app"
arch=('x86_64')
url="https://github.com/music-assistant/music-assistant-desktop"
conflicts=(squeezelite music-assistant-desktop-bin)
provides=(squeezelite music-assistant-desktop)
license=('Apache-2.0')
makedepends=(cargo git yarn rust webkit2gtk base-devel curl wget file openssl appmenu-gtk-module gtk3 libappindicator-gtk3 librsvg libvips)
md5sums=('a2ceedd70c8d83ec02e319c1378c6ead')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  git submodule update --init --recursive
  yarn
  cd frontend-source
  git clone --branch tauri-app https://github.com/music-assistant/frontend .
  yarn
  cd ..
  yarn run tauri build -b none
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
	install -DCm644 ./musicassistant.desktop "$pkgdir/usr/share/applications/musicassistant.desktop"
  install -DCm644 ./app-icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/musicassistant.png"
  install -DCm0755 -t "$pkgdir/usr/bin/" ./src-tauri/target/release/music-assistant-companion
  install -DCm0755 -t "$pkgdir/usr/bin/" ./src-tauri/target/release/squeezelite
}
