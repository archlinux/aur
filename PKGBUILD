# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-wam-git
pkgver=r54.c59ae0a
pkgrel=1
pkgdesc="Web App Manager written with love and libcosmic."
arch=('x86_64')
url="https://github.com/elevenhsoft/cosmic-wam"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/elevenhsoft/cosmic-wam.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '3dc3d3eaf91108051add7e57c45d318f26f18cef9ea279ebf900f8ec87cf3794')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm644 assets/icons/wam-icon.png \
    "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
    "$pkgdir/usr/share/applications/"
}
