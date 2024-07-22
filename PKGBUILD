pkgname=cosmic-ext-applet-external-monitor-brightness-git
pkgver=r30.13b212d
pkgrel=1
pkgdesc="External Monitor Brightness Applet for the COSMIC desktop"
arch=('x86_64')
url="https://github.com/maciekk64/cosmic-ext-applet-external-monitor-brightness"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/maciekk64/cosmic-ext-applet-external-monitor-brightness')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 target/release/${pkgname%-git} -t "$pkgdir/usr/bin/"
  install -Dm644 res/io.github.maciekk64.CosmicExtAppletExternalMonitorBrightness.desktop -t \
    "$pkgdir/usr/share/applications/"
}

