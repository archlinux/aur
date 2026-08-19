# Maintainer: Joseph R. Quinn <quinn.josephr@proton.me>
pkgname=claude-crab
pkgver=2.0.1
pkgrel=1
pkgdesc="A crab that walks above your panel while Claude Code works"
arch=('x86_64')
url="https://github.com/quinnjr/claude-crab"
license=('MIT')
# Rendering is pure Rust (skia-rs), so there is no Qt or KDE dependency any
# more. wayland is needed by the layer-shell backend, and the floating backend
# talks to the GPU through wgpu, which loads Vulkan at runtime.
depends=('wayland' 'vulkan-icd-loader' 'fontconfig')
makedepends=('cargo' 'python' 'python-pillow')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('18cf5d2ef1917db910eb2c776ebce7dc075fecc59cd7f18cddf987b9bc9f94fc')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
  # The Python helpers ship alongside the binary and have their own suites.
  python -m pytest -q tests/
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 tools/crab_hooks.py "$pkgdir/usr/bin/claude-crab-hooks"

  install -Dm644 packaging/claude-crab.service \
    "$pkgdir/usr/lib/systemd/user/claude-crab.service"
  install -Dm644 packaging/dev.quinnjr.claude-crab.desktop \
    "$pkgdir/usr/share/applications/dev.quinnjr.claude-crab.desktop"
  install -Dm644 packaging/dev.quinnjr.claude-crab.metainfo.xml \
    "$pkgdir/usr/share/metainfo/dev.quinnjr.claude-crab.metainfo.xml"

  # Icons are rendered by the build script from the same code as the sprite,
  # so they cannot drift from the character.
  local icondir
  icondir=$(find target/release/build -type d -name icons -print -quit)
  for size in 32 48 64 128 256; do
    install -Dm644 "$icondir/$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/dev.quinnjr.claude-crab.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
