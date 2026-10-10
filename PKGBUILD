# Maintainer: darkstardevx <dev@cybercoretech.net>

pkgname=cyberterm
pkgver=0.2.1
pkgrel=1
pkgdesc="GPU terminal for developers: splits and sessions, command blocks, searchable history, AI help, inline images and Lua scripting"
arch=('x86_64' 'aarch64')
url="https://cybercore-tech.github.io/cyberterm/"
license=('MIT')
depends=('gcc-libs' 'glibc' 'fontconfig' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
makedepends=('cargo')
optdepends=('vulkan-icd-loader: Vulkan rendering (falls back to OpenGL)'
            'ttf-jetbrains-mono-nerd: the default font'
            'noto-fonts-emoji: color emoji'
            'libnotify: desktop notifications for long commands')
conflicts=('cyberterm-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cybercore-tech/cyberterm/archive/refs/tags/v$pkgver.tar.gz"
        "cyberterm.desktop")
sha256sums=('b798ea1936239dd1bc3e72bd92fb2d47848b27bb74d1d4689485f9d4fe8d1739'
            '1e638aff925407a30963bd57a3a942831f5ea86b45a06941f88c23c5d684d0c3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin cyberterm
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/cyberterm "$pkgdir/usr/bin/cyberterm"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 assets/brand/cyberterm-icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/cyberterm.svg"
  install -Dm644 "$srcdir/cyberterm.desktop" "$pkgdir/usr/share/applications/cyberterm.desktop"
}
