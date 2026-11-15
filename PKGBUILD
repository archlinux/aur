# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=whatsatui-git
pkgver=r55.b88e9ab
pkgrel=1
pkgdesc="Personal WhatsApp terminal client with a cyan Ratatui interface (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/wuzi/whatsatui"
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=('mpv: voice-message and video playback'
            'ffmpeg: GIF previews'
            'xdg-utils: open links and downloaded files'
            'wl-clipboard: Wayland copy/paste'
            'xclip: X11 copy/paste'
            'xsel: X11 copy/paste alternative')
makedepends=('git' 'cargo' 'pkgconf')
provides=('whatsatui')
conflicts=('whatsatui')
source=("$pkgname::git+https://github.com/wuzi/whatsatui.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CARGO_BUILD_JOBS=2
  cargo build --locked --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/whatsapp-tui "$pkgdir/usr/bin/whatsapp-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 examples/config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
  install -Dm644 packaging/whatsapp-tui.desktop "$pkgdir/usr/share/applications/whatsapp-tui.desktop"
  install -Dm644 packaging/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/whatsapp-tui.svg"
}
