# Maintainer: Levi Renato <levirenato at gmail dot com>
pkgname=youtui-player
pkgver=1.3.0
pkgrel=1
pkgdesc="YouTube TUI player with playlist, thumbnails and Catppuccin themes"
arch=('x86_64' 'aarch64')
url="https://github.com/IvelOt/youtui-player"
license=('MIT')
depends=('mpv' 'yt-dlp' 'socat' 'ffmpeg')
optdepends=('xclip: clipboard support on X11'
  'xsel: clipboard support on X11 (alternative)'
  'wl-clipboard: clipboard support on Wayland')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('95d53ce5d3d00127d2aefbe84ed47b4e3c3a0173931618f2a15da83a849b5e86dd9e9afeb5d91ae3ca24651894e026be8e0ceec441ff528417d6049b1a75aa14')

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
