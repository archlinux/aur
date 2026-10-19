# Maintainer: Professor Lee <https://github.com/professor-lee>
pkgname=cnmplayer
pkgver=0.7.2
pkgrel=1
pkgdesc="A terminal-based Netease cloud music player with spectrum visualizer, lyrics support."
arch=('x86_64' 'aarch64')
url="https://github.com/professor-lee/CNMPlayer"
license=('AGPL-3.0-only')
depends=('alsa-lib' 'chafa' 'glib2' 'openssl' 'pipewire')
conflicts=('cnmplayer-bin' 'cnmplayer-git')
optdepends=(
  'ttf-nerd-fonts-symbols: For icons and spectrum visualizer'
  'ttf-jetbrains-mono-nerd: Recommended monospace font'
)
makedepends=('cargo' 'clang' 'cmake' 'pkgconf' 'git')
options=(!lto)
source=("https://github.com/professor-lee/CNMPlayer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0a81a4c85d06809200581fb350413c65c496476e61bc810cb1f87fd2ec04e3ea')

prepare() {
  cd "CNMPlayer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  # Fetch dependencies using the committed Cargo.lock; never regenerate it.
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "CNMPlayer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "CNMPlayer-${pkgver}"
  install -Dm755 "target/release/cnmplayer" "$pkgdir/usr/bin/cnmplayer"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "THIRD_PARTY_NOTICES.md" "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"

  # Reference defaults; the runtime seeds its writable asset root from embedded copies.
  if [ -d "config" ]; then
    install -Dm644 config/default.toml "$pkgdir/usr/share/cnmplayer/config/default.toml"
  fi
  if [ -d "themes" ]; then
    find themes -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/cnmplayer/{}" \;
  fi
}
