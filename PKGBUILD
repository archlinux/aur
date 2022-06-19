# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gpg-tui-git
pkgver=0.9.0.r1.g52a2ea1
pkgrel=1
pkgdesc="A terminal user interface for GnuPG (git)"
arch=('x86_64')
url="https://github.com/orhun/gpg-tui"
license=('MIT')
depends=('libxcb' 'libxkbcommon' 'gpgme')
makedepends=('cargo' 'python' 'git')
optdepends=(
  'xplr: for file selection support'
  'xclip: for clipboard support on X11 (or xsel)'
  'xsel: for clipboard support on X11 (or xclip)'
  'wl-clipboard: for clipboard support on Wayland'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  mkdir completions/
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
  OUT_DIR=completions/ target/release/gpg-tui-completions
}

check() {
  cd "${pkgname%-git}"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "man/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "man/${pkgname%-git}.toml.5" -t "$pkgdir/usr/share/man/man5"
  install -Dm 644 "completions/${pkgname%-git}.bash" "$pkgdir/usr/share/bash-completion/completions/${pkgname%-git}"
  install -Dm 644 "completions/${pkgname%-git}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/_${pkgname%-git}" -t "$pkgdir/usr/share/zsh/site-functions"
}
