# Maintainer: stevenx65 stevenxy35@gmail.com
pkgname=opal-player
pkgver=1.0.0
pkgrel=1
pkgdesc="Beautiful terminal music player built with Rust"
arch=('x86_64')
url="https://github.com/stevenx65/opal-player"
license=('MIT')
depends=('alsa-lib' 'glib2')
makedepends=('cargo' 'git')
conflicts=('opal-tui')
replaces=('opal-tui')
provides=('opal-tui')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  # 先查看 Cargo.toml 确认二进制名（自动适配）
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"

  # 自动检测编译出来的二进制文件名（兼容 opal-tui 或 opal-player）
  local bin_name
  if [ -f "target/release/opal-tui" ]; then
    bin_name="opal-tui"
  elif [ -f "target/release/opal-player" ]; then
    bin_name="opal-player"
  else
    error "No binary found in target/release/"
    return 1
  fi

  # 安装主二进制
  install -Dm755 "target/release/$bin_name" "$pkgdir/usr/bin/opal-player"

  # 兼容旧命令（用户仍可输入 opal-tui 启动）
  ln -s /usr/bin/opal-player "$pkgdir/usr/bin/opal-tui"

  # 安装许可证
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
