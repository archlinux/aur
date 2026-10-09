# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=volt-gui
pkgver=2.4.2
pkgrel=1
pkgdesc="Control panel for Vulkan games on Linux."
arch=('x86_64')
url="https://github.com/pythonlover02/volt-gui"
license=('GPL-3.0-only')
depends=(
  'bash'
  'pyside6'
  'python'
  'vulkan-icd-loader'
)
makedepends=('cargo')
optdepends=("lib32-libvolt=$pkgver: 32-bit support")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('e95cf5aad01a2290080946d5e609326a4f54ea5af8ff616561400c8d1acb585a'
            '0fecb7aa42634bf2bcfa26d04ebc1b8cdf809d88bdf7f8cb47538455b25225a1'
            '793d25522428248cebaa83e802aef4f31ceed55ddd5e0f2beb2c2031835ddb2b')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/volt -t "$pkgdir/usr/bin/"
  install -Dm755 target/release/volt-probe -t "$pkgdir/usr/bin/"
  install -Dm755 target/release/libvolt.so -t "$pkgdir/usr/lib/"
  install -Dm644 "src/$pkgname"/*.py -t "$pkgdir/usr/share/$pkgname/"
  install -Dm644 VkLayer_volt.json -t "$pkgdir/usr/share/vulkan/implicit_layer.d/"
  install -Dm644 images/icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  # Compile Python bytecode
  python -m compileall -d / "$pkgdir/usr/share/$pkgname"
  python -O -m compileall -d / "$pkgdir/usr/share/$pkgname"
}
