# Maintainer: stevenx65 <stevenxy35@gmail.com>
pkgname=opal-player
pkgver=1.0.1
pkgrel=1
pkgdesc="A modern, minimal, fully-featured TUI music player"
arch=('x86_64')
url="https://github.com/stevenx65/opal-player"
license=('MIT')
depends=('alsa-lib' 'glib2')
makedepends=('cargo' 'git')
# 【优化】添加对 -bin 包的冲突声明
#conflicts=('opal-tui' 'opal-player-bin')
#replaces=('opal-tui')
#provides=('opal-tui' 'opal-player')
#source=("$pkgname::git+$url.git")
#sha256sums=('SKIP')
#警告⚠️：opal-player-bin并不属于该作者

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"

  # 自动检测二进制名（兼容新旧仓库）
  local bin_name
  if [ -f "target/release/opal-player" ]; then
    bin_name="opal-player"
  elif [ -f "target/release/opal-tui" ]; then
    bin_name="opal-tui"
  else
    error "No binary found in target/release/"
    return 1
  fi

  # 安装主程序
  install -Dm755 "target/release/$bin_name" "$pkgdir/usr/bin/opal-player"

  # 兼容旧命令
  ln -s /usr/bin/opal-player "$pkgdir/usr/bin/opal-tui"

  # 安装许可证
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
