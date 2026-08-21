# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=volt-gui
pkgver=2.0.0
pkgrel=3
pkgdesc="A graphical control panel for Vulkan games on Linux."
arch=('x86_64')
url="https://github.com/pythonlover02/volt-gui"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'mesa-utils'
  'pyside6'
  'python'
  'vulkan-mesa-layers'
)
makedepends=('cargo')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('da3b7a00cdcf25ca5c999caa7cd4e08c184037296bebc096a9f1c438e1b08a8c'
            '1581606e978f09077743a7b3001498f99b4e141ca0eb229e8bac4d63ddf6692b'
            '9852a7ff299da58c8b8be0439d8560350a812f8a004eab44481433cec7fa398a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path volt/Cargo.toml --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver/volt"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 volt/target/release/volt -t "$pkgdir/usr/bin/"
  install -Dm755 volt/target/release/libvolt.so -t "$pkgdir/usr/lib/"
  install -Dm644 "$pkgname"/*.py -t "$pkgdir/opt/$pkgname/"
  install -Dm644 VkLayer_volt.json -t "$pkgdir/usr/share/vulkan/implicit_layer.d/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  # Compile Python bytecode
  python -m compileall -d / "$pkgdir/opt/$pkgname"
  python -O -m compileall -d / "$pkgdir/opt/$pkgname"
}
