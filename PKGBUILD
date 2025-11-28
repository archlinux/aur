# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=jay-git
pkgver=1.11.0.r154.ge81b31b
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
  mesa
  pango
)
optdepends=(
  'xorg-xwayland: X11 support'
  'xdg-desktop-portal: portal support'
)
makedepends=(
  cargo
  cmake
  git
  shaderc
)
options=(!lto)
source=('jay::git+https://github.com/mahkoh/jay.git#branch=master')
install=jay.install
sha512sums=('SKIP')

prepare() {
  cd jay/
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd jay/
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd jay/
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd jay/
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
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
