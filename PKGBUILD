# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=volt-gui
pkgver=2.3.1
pkgrel=2
pkgdesc="Control panel for Vulkan games on Linux."
arch=('x86_64')
url="https://github.com/pythonlover02/volt-gui"
license=('GPL-3.0-or-later')
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
sha256sums=('aa3a6630dbc84e8ed20bb4288a0e57e7cff98b5df71d69422efa1420833f98e0'
            '1581606e978f09077743a7b3001498f99b4e141ca0eb229e8bac4d63ddf6692b'
            'c82597f8145064d9360bf16caff67548d08f883bf3ecf4fafb2d38d1a55fb556')

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
  install -Dm644 "src/$pkgname"/*.py -t "$pkgdir/opt/$pkgname/"
  install -Dm644 VkLayer_volt.json -t "$pkgdir/usr/share/vulkan/implicit_layer.d/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  # Compile Python bytecode
  python -m compileall -d / "$pkgdir/opt/$pkgname"
  python -O -m compileall -d / "$pkgdir/opt/$pkgname"
}
