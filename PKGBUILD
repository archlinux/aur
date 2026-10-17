# Maintainer: Floofy <FloofyIV9@proton.me>

pkgname=rosemary
pkgver=0.3.0
pkgrel=1
pkgdesc="Compatibility layer and high level emulator hybrid for running macOS applications"
arch=(x86_64)
url="https://github.com/microlift/rosemary"
license=(GPL-3.0-only)
depends=(
  curl
  glibc
  libgcc
  libxkbcommon
  zlib
)
makedepends=(cargo)
optdepends=(
  'openal: OpenAL support'
  'sdl3: For running GUI apps'
  'vulkan-driver: Metal support'
  'vulkan-icd-loader: Metal support'
  'glib-networking: WebView support'
  'webkitgtk-6.0: WebView support'
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('58d01fa12c7bf31a41cc93f395d5081c50b866dff8be49b46fc54de8e87da6b1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -vDm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -vDm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
