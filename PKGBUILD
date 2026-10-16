pkgname=ionterm-git
pkgver=r35.b8390ad
pkgrel=1
pkgdesc='GPU-rendered terminal emulator for the Ionix desktop, with kitty-style graphics and features'
arch=('x86_64' 'aarch64')
url='https://github.com/LucasionGS/ionterm'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'vulkan-icd-loader' 'vulkan-driver' 'fontconfig')
makedepends=('cargo' 'git')
optdepends=(
  'ttf-jetbrains-mono-nerd: the default font'
  'noto-fonts-emoji: colour emoji'
)
provides=('ionterm')
conflicts=('ionterm')
source=("$pkgname::git+https://github.com/LucasionGS/ionterm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  env -u RUSTFLAGS -u CFLAGS -u CXXFLAGS -u LDFLAGS cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/ionterm "$pkgdir/usr/bin/ionterm"
  install -Dm644 data/ionterm.desktop "$pkgdir/usr/share/applications/ionterm.desktop"
  install -Dm644 data/icons/ionterm.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ionterm.svg"
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "data/icons/hicolor/${size}x${size}/apps/ionterm.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ionterm.png"
  done
  install -Dm644 extras/ionterm.toml "$pkgdir/usr/share/doc/ionterm/ionterm.toml"
  # Shipped but not compiled into /usr/share/terminfo yet: TERM=xterm-ionterm
  # only becomes the default once the SSH wrapper (v0.3) can fall back for
  # hosts without the entry.
  install -Dm644 extras/terminfo/ionterm.terminfo "$pkgdir/usr/share/ionterm/terminfo/ionterm.terminfo"
}
