# Maintainer: Levi Renato <levirenato at gmail dot com>
pkgname=youtui-player
pkgver=1.3.1
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
b2sums=('cd1c13a6a7931eaa45e4f889cbcd32ec8c91795e7fbf054d8592f6f3dac1f237afcc37eacbad029c38823c28e35115d7e9c3f9fdbd84d557f5b34274a587018c')

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
