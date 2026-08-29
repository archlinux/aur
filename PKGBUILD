# Maintainer: Professor Lee <https://github.com/professor-lee>
pkgname=cnmplayer-git
pkgver=preview
pkgrel=2
pkgdesc="A terminal-based Netease cloud music player with spectrum visualizer, lyrics support. (Development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/professor-lee/CNMPlayer"
license=('AGPL3')
depends=('alsa-lib' 'chafa' 'glib2' 'openssl' 'pipewire')
optdepends=(
  'cava: spectrum visualization'
  'ttf-nerd-fonts-symbols: For icons and spectrum visualizer'
  'ttf-jetbrains-mono-nerd: Recommended monospace font'
)
# 必须添加 git 以便拉取仓库
makedepends=('cargo' 'cmake' 'pkgconf' 'git')
provides=("cnmplayer")
conflicts=("cnmplayer")
options=(!lto)

# 仅修改仓库地址，指向 develop 分支
source=("${pkgname}::git+https://github.com/professor-lee/CNMPlayer.git#branch=develop")
sha256sums=('SKIP')

# AUR 页面展示占位版本；实际构建时由 pkgver() 计算真实版本（如 0.5.1.rN.gHASH）
pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  # 使用仓库内 Cargo.lock，保证 -git 构建可复现（不重新生成 lockfile）
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

  # Copy default config and themes if present
  if [ -d "config" ]; then
    install -Dm644 config/default.toml "$pkgdir/usr/share/cnmplayer/config/default.toml"
  fi
  if [ -d "themes" ]; then
    find themes -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/cnmplayer/{}" \;
  fi
}
