# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: svartalf <self@svartalf.info>

pkgname=battop
pkgver=0.2.4
pkgrel=3
pkgdesc="Interactive batteries viewer"
url="https://github.com/svartalf/rust-battop"
license=('Apache-2.0' 'MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('1a54b29d0c0ac24cac4ecf1127e72fc50e00b5a47d70548cea20f02b30cf3e7a')

prepare() {
# Shortcut
  echo -e "[Desktop Entry]
Name=battop
Exec=battop
Icon=battop
Terminal=true
Type=Application
Comment=Interactive batteries viewer" > battop.desktop

# Update the dependencies $url/issues/29
  cd rust-battop-$pkgver
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo update

# Dependencies
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd rust-battop-$pkgver
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  install -Dm644 battop.desktop -t "$pkgdir/usr/share/applications"
  cd rust-battop-$pkgver
  install -Dm644 assets/screenshot.png "$pkgdir/usr/share/pixmaps/battop.png"
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/battop"
  install -Dm644 LICENSE-APACHE LICENSE-MIT -t "$pkgdir/usr/share/licenses/battop"
  install -Dm755 target/release/battop -t "$pkgdir/usr/bin"
}
