# Maintainer: darkstardevx <dev@cybercoretech.net>

pkgname=cyberterm
pkgver=0.4.1
pkgrel=1
pkgdesc="GPU terminal for developers: splits and sessions, command blocks, searchable history, AI help, inline images and Lua scripting"
arch=('x86_64' 'aarch64')
url="https://cybercoretech.github.io/cyberterm/"
license=('MIT')
depends=('gcc-libs' 'glibc' 'fontconfig' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
makedepends=('cargo')
optdepends=('vulkan-icd-loader: Vulkan rendering (falls back to OpenGL)'
            'ttf-jetbrains-mono-nerd: the default font'
            'noto-fonts-emoji: color emoji'
            'libnotify: desktop notifications for long commands')
conflicts=('cyberterm-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cybercoretech/cyberterm/archive/refs/tags/v$pkgver.tar.gz"
        "cyberterm.desktop")
sha256sums=('9b1ba52b891971530734e84d99d66b053d98ee63ac13ba52ec143afd532200f0'
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
