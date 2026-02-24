# Maintainer: Levi Renato <levirenato at gmail dot com>
pkgname=youtui-player
pkgver=1.2.0
pkgrel=1
pkgdesc="YouTube TUI player with playlist, thumbnails and Catppuccin themes"
arch=('x86_64' 'aarch64')
url="https://github.com/IvelOt/youtui-player"
license=('MIT')
depends=('mpv' 'yt-dlp' 'socat')
optdepends=('xclip: clipboard support on X11'
  'xsel: clipboard support on X11 (alternative)'
  'wl-clipboard: clipboard support on Wayland')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('903b8d4ec321d124d22495d52051415bdc9e4a9cc9a1b103490f6856a967d6b0c455c86ff4ebcb3e7a27e7fa9ef747070fada7bde19870c9a638fa1fc10d9611')

prepare() {
  cd "youtui-player-$pkgver"
  go mod download
}

build() {
  cd "youtui-player-$pkgver"
  export CGO_ENABLED=0
  go build \
    -trimpath \
    -ldflags "-X main.Version=$pkgver -s -w" \
    -o "$pkgname" .
}

package() {
  cd "youtui-player-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
