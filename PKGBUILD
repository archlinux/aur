# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=jay
pkgver=1.15.0
pkgrel=1
pkgdesc='A Wayland Compositor'
arch=('x86_64')
license=(GPL-3.0-only)
url='https://github.com/mahkoh/jay'
provides=(
  wayland-compositor
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
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mahkoh/jay/archive/v$pkgver.tar.gz")
install=jay.install
sha512sums=('296df0ea96bb5e7050980486baf73c5c5f5373c7d23ed4ceb3665e1cd90c6f60c6b55c38ff9fe6dd88c979e874b9748ea5a189d731fef35db308f2906d22ef40')

prepare() {
  cd $pkgname-$pkgver/
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver/
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver/
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd $pkgname-$pkgver/

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
