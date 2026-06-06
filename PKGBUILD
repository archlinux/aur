# Maintainer: Anas <anas1412@github>
# Contributor: Anas <anas1412@github>
# Arch User Repository (AUR) package for ytmgo
# https://aur.archlinux.org/packages/ytmgo

pkgname=ytmgo
pkgver=0.3.0
pkgrel=1
pkgdesc="A terminal-based YouTube Music client — search, download, queue, and play music from the keyboard"
arch=('x86_64' 'aarch64')
url="https://github.com/anas1412/ytmgo"
license=('MIT')
depends=('mpv' 'yt-dlp' 'ffmpeg')
makedepends=('go>=1.22')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CGO_ENABLED=0 go build \
    -ldflags="-s -w -X ytmgo/internal/version.Version=v$pkgver" \
    -o ytmgo .
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./ytmgo --version 2>&1 | grep -q "v$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ytmgo "$pkgdir/usr/bin/ytmgo"
  install -Dm644 ytmgo-logo.png "$pkgdir/usr/share/pixmaps/ytmgo.png"

  # Desktop entry for terminal launchers
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ytmgo.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=ytmgo
Comment=YouTube Music from the Terminal
Exec=ytmgo
Icon=ytmgo
Terminal=true
Categories=Audio;Music;Player;
EOF
}
