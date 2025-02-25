# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=caffeine-applet-git
pkgver=r2.2c2f58a
pkgrel=1
pkgdesc="A simple COSMIC applet that prevents your system from going idle by creating a systemd-inhibit lock session."
arch=('x86_64' 'aarch64')
url="https://github.com/codevardhan/caffeine-applet"
license=('MIT')
depends=('cosmic-applets')
makedepends=(
  'cargo'
  'git'
)
source=('git+https://github.com/codevardhan/caffeine-applet.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm644 "assets/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 assets/coffee-full.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
