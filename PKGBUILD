# Maintainer: soloturn@gmail.com
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=cosmic-text-editor-git
pkgver=r11.1618c79
pkgrel=1
pkgdesc="Text editor of COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-text-editor"
license=('GPL3')
depends=('fontconfig' 'gtk3')
makedepends=('cargo' 'git' 'mold')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=(
  'git+https://github.com/pop-os/cosmic-text-editor.git'
  "${pkgname%-git}.desktop"
)
sha256sums=(
  'SKIP'
  '5a1614e9d0a072d9711d17bdacf456ba8877fc365ad263cff7c0e8283f01a799'
)

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"
  cargo build --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
}
