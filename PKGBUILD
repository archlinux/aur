# Maintainer: Professor Lee <https://github.com/professor-lee>
pkgname=cnmplayer-git
pkgver=0.4.0
pkgrel=1
pkgdesc="A terminal-based Netease cloud music player with spectrum visualizer, lyrics support. (Development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/professor-lee/CNMPlayer"
license=('AGPL3')
depends=('alsa-lib' 'dbus' 'chromaprint' 'fftw' 'cava' 'chafa' 'pipewire')
optdepends=(
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

# 必须添加 pkgver 函数以符合 AUR 的 Git 包规范
pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo generate-lockfile
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
