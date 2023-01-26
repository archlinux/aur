# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=swayosd-git
pkgver=r9.b7b4e3d
pkgrel=2
pkgdesc="A GTK based on screen display for keyboard shortcuts like caps-lock and volume"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/ErikReider/SwayOSD"
license=('GPL3')
depends=('gtk3' 'gtk-layer-shell' 'pulseaudio')
makedepends=('git' 'cargo')
provides=('swayosd')
conflicts=('swayosd')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "SwayOSD"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "SwayOSD"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "SwayOSD"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "SwayOSD"
  install -Dm 755 "target/release/swayosd" "${pkgdir}/usr/bin/swayosd"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/swayosd/README.md"
}
