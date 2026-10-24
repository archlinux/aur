# Maintainer: Floofy <FloofyIV9@proton.me>

pkgname=rosemary
pkgver=0.4.1
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
provides=("$pkgname=${pkgver%%.3*}")
conflicts=("$pkgname")
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f15a47a834a3ec4bb611bb7b06fe4f6a42714201bfc2ec0079a1f28636545050')

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
