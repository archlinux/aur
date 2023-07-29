# Maintainer: Jonathan Bangert <jonathan@bangert.dk>
pkgname='music-assistant-desktop'
_pkgname='massapp'
pkgver=0.0.8
pkgrel=1
pkgdesc="Music Assistant Desktop app"
arch=('x86_64')
url="https://github.com/Un10ck3d/massapp"
conflicts=(squeezelite)
provides=(squeezelite music-assistant-desktop)
license=('Apache-2.0')
makedepends=(cargo git rust webkit2gtk base-devel curl wget file openssl appmenu-gtk-module gtk3 libappindicator-gtk3 librsvg libvips)
md5sums=('50deadcd9f68e3606611ad198816dd19')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Un10ck3d/massapp/archive/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  git submodule update --init --recursive
	sudo npm install -g yarn
  yarn
  cd frontend-source
  git clone --branch tauri-app https://github.com/music-assistant/frontend .
  yarn
  cd ..
  yarn run tauri build -b none
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
	install -DCm644 ./musicassistant.desktop "$pkgdir/usr/share/applications/musicassistant.desktop"
  install -DCm644 ./app-icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/musicassistant.png"
  install -DCm0755 -t "$pkgdir/usr/bin/" ./src-tauri/target/release/music-assistant-desktop
  install -DCm0755 -t "$pkgdir/usr/bin/" ./src-tauri/target/release/squeezelite
}
