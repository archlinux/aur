# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=jay-git
pkgver=r1070.388a4d1c
pkgrel=1
pkgdesc='A Wayland Compositor'
arch=('x86_64')
license=(GPL-3.0-only)
url='https://github.com/mahkoh/jay'
provides=(
  jay
  wayland-compositor
)
conflicts=(
  jay
)
depends=(
  cairo
  libinput
  libudev.so
  libvulkan.so
  libxkbcommon.so
  mesa
  pango
)
optdepends=(
  'xorg-xwayland: X11 support'
  'xdg-desktop-portal: portal support'
)
makedepends=(
  git
  'rust>=1.84.0'
  shaderc
)
options=(!lto)
source=('jay::git+https://github.com/mahkoh/jay.git#branch=master')
sha512sums=('SKIP')

pkgver() {
  cd jay/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd jay/
  cargo build --release --locked
}

check() {
  cd jay/
  cargo test --release --locked
}

package() {
  cd jay/

  install -D -m755 -s target/release/jay $pkgdir/usr/bin/jay
  install -D -m644 etc/jay.portal $pkgdir/usr/share/xdg-desktop-portal/portals/jay.portal
  install -D -m644 etc/jay-portals.conf $pkgdir/usr/share/xdg-desktop-portal/jay-portals.conf

  mkdir -p $pkgdir/usr/share/zsh/site-functions/
  target/release/jay generate-completion zsh > $pkgdir/usr/share/zsh/site-functions/_jay

  mkdir -p $pkgdir/usr/share/bash-completion/completions/
  target/release/jay generate-completion bash > $pkgdir/usr/share/bash-completion/completions/jay

  mkdir -p $pkgdir/usr/share/fish/vendor_completions.d/
  target/release/jay generate-completion fish > $pkgdir/usr/share/fish/vendor_completions.d/jay.fish
}
