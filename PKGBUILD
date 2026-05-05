# Maintainer: stevenx65 <stevenxy35@gmail.com>
pkgname=opal-player
pkgver=1.0.1.r22.gf5904a1 # 会自动生成，不用改
pkgrel=1
pkgdesc="A modern, minimal, fully-featured TUI music player"
arch=('x86_64')
url="https://github.com/stevenx65/opal-player"
license=('MIT')
depends=('alsa-lib' 'glib2')
makedepends=('cargo' 'git')
replaces=('opal-tui')
provides=('opal-tui' 'opal-player')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

# 【修改】不用 git describe，直接用 commit 哈希值
pkgver() {
  cd "$srcdir/$pkgname"
  printf "1.0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"

  local bin_name
  if [ -f "target/release/opal-player" ]; then
    bin_name="opal-player"
  elif [ -f "target/release/opal-tui" ]; then
    bin_name="opal-tui"
  else
    error "No binary found"
    return 1
  fi

  install -Dm755 "target/release/$bin_name" "$pkgdir/usr/bin/opal-player"
  ln -s /usr/bin/opal-player "$pkgdir/usr/bin/opal-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
