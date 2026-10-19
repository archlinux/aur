# Maintainer: Professor Lee <https://github.com/professor-lee>
pkgname=cnmplayer-git
_basever=0.7.2
pkgver=$_basever
pkgrel=4
pkgdesc="A terminal-based Netease cloud music player with spectrum visualizer, lyrics support. (Development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/professor-lee/CNMPlayer"
license=('AGPL-3.0-only')
depends=('alsa-lib' 'chafa' 'glib2' 'openssl' 'pipewire')
optdepends=(
  'ttf-nerd-fonts-symbols: For icons and spectrum visualizer'
  'ttf-jetbrains-mono-nerd: Recommended monospace font'
)
# clang supplies libclang for bindgen; git is required by the VCS source.
makedepends=('cargo' 'clang' 'cmake' 'pkgconf' 'git')
provides=("cnmplayer")
conflicts=("cnmplayer" "cnmplayer-bin")
options=(!lto)

# Track development commits; recipe changes, not each upstream commit, are synced to AUR.
source=("${pkgname}::git+https://github.com/professor-lee/CNMPlayer.git#branch=develop")
sha256sums=('SKIP')

# AUR 展示与排序基准；每次发布新 tag 时同步递增 _basever。
# 实际构建时由 pkgver() 追加 develop 提交数与哈希（如 0.7.2.r314.gHASH）。
pkgver() {
  cd "${pkgname}"
  printf '%s.r%s.g%s' \
    "$_basever" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  # Use the committed Cargo.lock without regenerating it.
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname}"
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
