# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=lemon-studio-git
pkgver=0.0.0
pkgrel=1
pkgdesc='A free and open-source digital audio workstation written in Rust'
arch=('x86_64')
url='https://github.com/ItsAlphaNeon/Lemon-Studio'
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libx11' 'libxcb' 'libxcursor'
         'libxi' 'libxinerama' 'libxrandr' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland' 'hicolor-icon-theme')
makedepends=('cargo' 'clang' 'git' 'pkgconf')
optdepends=('zenity: native confirmation dialogs'
            'kdialog: native confirmation dialogs on KDE'
            'xorg-xwayland: X11 plug-in windows on Wayland desktops'
            'pipewire-alsa: route ALSA audio through PipeWire'
            'pulseaudio-alsa: route ALSA audio through PulseAudio')
provides=("lemon-studio=$pkgver")
conflicts=('lemon-studio')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Lemon-Studio"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/Lemon-Studio"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/Lemon-Studio"
  cargo build --release --frozen --package os-app
}

package() {
  cd "$srcdir/Lemon-Studio"
  install -Dm755 target/release/lemonstudio "$pkgdir/usr/bin/lemonstudio"
  install -Dm644 crates/os-app/assets/lemonstudio.desktop "$pkgdir/usr/share/applications/lemonstudio.desktop"
  install -Dm644 crates/os-app/assets/lemonstudio.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/lemonstudio.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY-NOTICES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
}
