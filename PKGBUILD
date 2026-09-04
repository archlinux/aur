# Maintainer: PandaDEV <hello@pandadev.net>
pkgname=vleer-git
pkgver=r488.g7428167
pkgrel=1
pkgdesc="Music, but without the subscription."
arch=('x86_64' 'aarch64')
url="https://github.com/vleerapp/vleer"
license=('AGPL-3.0')
depends=('alsa-lib' 'libglvnd' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader' 'wayland')
makedepends=('git' 'rust' 'cargo' 'cmake')
provides=('vleer')
conflicts=('vleer')
source=("git+${url}")
sha256sums=('SKIP')
options=('!strip' '!lto')

pkgver() {
  cd "$srcdir/vleer"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/vleer"
  cargo build --release --locked
}

package() {
  cd "$srcdir/vleer"

  install -Dm755 target/release/vleer "$pkgdir/usr/bin/vleer"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for size in 128 256 512; do
    install -Dm644 "assets/images/icon-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/vleer.png"
  done

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/vleer.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Vleer
Comment=Music, but without the subscription.
Exec=vleer %U
Icon=vleer
Terminal=false
Categories=AudioVideo;Audio;Player;
StartupWMClass=vleer
DESKTOP
}
