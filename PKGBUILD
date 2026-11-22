# Maintainer: Nynxz

pkgname=wlens
pkgver=0.1.0
pkgrel=1
pkgdesc="An image viewer for Wayland, configured and extended with Lua"
arch=('x86_64' 'aarch64')
url="https://github.com/Nynxz/wlens"
license=('MIT')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'gst-plugins-base-libs'
  'gstreamer'
  'libxkbcommon'
  'vulkan-icd-loader'
  'wayland'
)
makedepends=('cargo')
optdepends=(
  'gst-libav: more video formats'
  'gst-plugins-good: more video formats'
  'libnotify: a notification when wlens fails to start'
  'wl-clipboard: copying paths and images'
)
# Lua is built from C; makepkg's LTO objects can't be linked by rustc.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d42d2d0c12e4cb8d701c374c018f04070465a18894e7db261d73f1bcc86336ea')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/wlens "$pkgdir/usr/bin/wlens"
  install -Dm644 packaging/wlens.desktop "$pkgdir/usr/share/applications/wlens.desktop"
  install -Dm644 packaging/wlens.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wlens.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r docs examples "$pkgdir/usr/share/doc/$pkgname/"
}
