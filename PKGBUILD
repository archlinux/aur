# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=moonlander-git
pkgver=r229.abfb9cd
pkgrel=1
pkgdesc="Just another "fancy" Gemini client."
arch=('x86_64')
url="https://git.sr.ht/~admicos/moonlander"
license=('MIT')
depends=('gtk3')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=('git+https://git.sr.ht/~admicos/moonlander')
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

check() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm644 "misc/${pkgname%-git}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "misc/${pkgname%-git}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
