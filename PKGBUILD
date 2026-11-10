# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=frugalrgb
pkgver=0.5.0
pkgrel=1
pkgdesc="Lightweight standalone RGB controller for PC hardware (no bloat, just LEDs)"
arch=('x86_64' 'aarch64')
url="https://github.com/emaspa/frugalRGB"
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'fontconfig' 'systemd-libs' 'libxkbcommon' 'wayland'
         'libx11' 'libxcursor' 'libxi' 'libxrandr')
makedepends=('cargo')
install=frugalrgb.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('914e89ed573ad0625d25a5743ca045bc3d04445bb4a24b093d626bbe39a4e975')

# The same flags for build and check, or check compiles everything again.
# The remap keeps the build directory out of the binary.
_cargo_env() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
}

prepare() {
  cd "frugalRGB-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "frugalRGB-$pkgver"
  _cargo_env
  cargo build --frozen --release -p frugalrgb
}

check() {
  cd "frugalRGB-$pkgver"
  _cargo_env
  cargo test --frozen --release -p frugalrgb-core
}

package() {
  cd "frugalRGB-$pkgver"

  install -Dm755 target/release/frugalrgb "$pkgdir/usr/bin/frugalrgb"

  # Device access + kernel modules for DRAM RGB
  install -Dm644 70-frugalrgb.rules "$pkgdir/usr/lib/udev/rules.d/70-frugalrgb.rules"
  install -d "$pkgdir/usr/lib/modules-load.d"
  printf 'i2c-dev\ni2c-piix4\ni2c-i801\n' > "$pkgdir/usr/lib/modules-load.d/frugalrgb.conf"
  chmod 644 "$pkgdir/usr/lib/modules-load.d/frugalrgb.conf"

  # Desktop integration
  install -Dm644 packaging/frugalrgb.desktop "$pkgdir/usr/share/applications/frugalrgb.desktop"
  install -Dm644 packaging/frugalrgb.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/frugalrgb.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
