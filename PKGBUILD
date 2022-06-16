# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Jeff Wright <jeff@teamjk.page>

pkgname=diskonaut-git
pkgver=0.11.0.r3.g65cd829
pkgrel=1
pkgdesc='Terminal disk space navigator'
arch=('x86_64')
url='https://github.com/imsnif/diskonaut'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname"
  cargo build --release --frozen --all-features
}

check() {
  cd "$pkgname"
  cargo test --release --frozen --all-features
}

package() {
  cd "$pkgname"
  install -D target/release/diskonaut -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
