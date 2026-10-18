# Maintainer: Christian Helle <christian.helle@outlook.com>
pkgname=httprunner
pkgver=1.2.55
pkgrel=1
pkgdesc="Execute HTTP requests from .http files (CLI, TUI and GUI)"
arch=('x86_64' 'aarch64')
url="https://github.com/christianhelle/httprunner"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo' 'pkg-config')
optdepends=(
  'libxkbcommon: required by httprunner-gui'
  'wayland: httprunner-gui on Wayland'
  'libx11: httprunner-gui on X11'
  'libglvnd: OpenGL rendering for httprunner-gui'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "httprunner-gui.desktop")
sha256sums=('3d9ec0e996cb4f561022478eee6f75dc61c59e9be70f22b77be610c1fd36600d'
            '630c69eed75b0ac17c11789ae1f629c496bcfa0e79fea5aad6b88cf48377bfca')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s/version = \"0.1.0\"/version = \"$pkgver\"/" Cargo.toml src/*/Cargo.toml
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p httprunner-core
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/httprunner "$pkgdir/usr/bin/httprunner"
  install -Dm755 target/release/httprunner-tui "$pkgdir/usr/bin/httprunner-tui"
  install -Dm755 target/release/httprunner-gui "$pkgdir/usr/bin/httprunner-gui"
  install -Dm644 "$srcdir/httprunner-gui.desktop" "$pkgdir/usr/share/applications/httprunner-gui.desktop"
  install -Dm644 images/httprunner.iconset/icon_512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/httprunner-gui.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
