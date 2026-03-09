# Maintainer: Rami <ramialosmann@gmail.com>
pkgname=salatui-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Islamic prayer times TUI clock for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ramialosmann/salatui"
license=('GPL-3.0-or-later')
makedepends=('cargo' 'git')
optdepends=('libnotify: desktop notifications via notify-send')
provides=('salatui')
conflicts=('salatui')
source=("git+https://github.com/ramialosmann/salatui.git")
sha256sums=('SKIP')

pkgver() {
  cd salatui
  printf "%s.r%s.%s" "0.1.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd salatui
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd salatui
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd salatui
  install -Dm755 "target/release/salatui" "$pkgdir/usr/bin/salatui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
