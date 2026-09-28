# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=jay-git
pkgver=1.14.0.r534.gcc66acd
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
  fontconfig
  gcc-libs
  glib2
  glibc
  libinput
  libudev.so=1
  libvulkan.so=1
  mesa
  pango
)
optdepends=(
  'fuse3: mount the debug filesystem'
  'sqlite: session management'
  'xdg-desktop-portal: portal support'
  'xorg-xwayland: X11 support'
)
makedepends=(
  cargo
  git
)
options=(!lto)
source=('jay::git+https://github.com/mahkoh/jay.git#branch=master')
install=jay.install
b2sums=('SKIP')

pkgver() {
  cd jay/
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd jay/
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  install -D -m644 etc/jay.desktop $pkgdir/usr/share/wayland-sessions/jay.desktop
  install -D -m644 etc/jay.portal $pkgdir/usr/share/xdg-desktop-portal/portals/jay.portal
  install -D -m644 etc/jay-portals.conf $pkgdir/usr/share/xdg-desktop-portal/jay-portals.conf

  mkdir -p $pkgdir/usr/share/zsh/site-functions/
  target/release/jay generate-completion zsh > $pkgdir/usr/share/zsh/site-functions/_jay

  mkdir -p $pkgdir/usr/share/bash-completion/completions/
  target/release/jay generate-completion bash > $pkgdir/usr/share/bash-completion/completions/jay

  mkdir -p $pkgdir/usr/share/fish/vendor_completions.d/
  target/release/jay generate-completion fish > $pkgdir/usr/share/fish/vendor_completions.d/jay.fish
}
