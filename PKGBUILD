# Maintainer: xero <xero@xeron.cc>
pkgname=xerotop-git
_pkgname=xerotop
pkgver=0.1.0.r195.g82f4ab9
pkgrel=1
pkgdesc="A gkrellm-style, battery-conscious Wayland (wlroots/layer-shell) system monitor bar in Rust + GTK4"
arch=('x86_64')
url="https://github.com/LXXero/xerotop"
license=('GPL-3.0-or-later')
depends=('gtk4' 'gtk4-layer-shell' 'ttf-firacode-nerd')
makedepends=('git' 'cargo')
optdepends=('brightnessctl: brightness panel adjustment')
provides=('xerotop')
conflicts=('xerotop')
# ring (crypto dep via the weather HTTPS fetch) ships non-LTO asm; LTO breaks
# its symbol resolution at link time. !debug: the stripped release binary has no
# debug symbols, so skip the empty -debug split package.
options=('!lto' '!debug')
source=("git+https://github.com/LXXero/xerotop.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.g%s" \
    "$(sed -n 's/^version *= *"\(.*\)"/\1/p' Cargo.toml | head -1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$_pkgname"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
