# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=bticino-easykit
pkgver=0.2.0
pkgrel=1
pkgdesc="Unofficial client for the BTicino EASYKIT WiFi video door entry kit (live view, two-way audio, door release)"
arch=('x86_64' 'aarch64')
url="https://github.com/deddroid/bticino-easykit"
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('cargo' 'pkgconf')
conflicts=('bticino-easykit-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('176326cfdf6e1bab9235a12ee06d45a05e675e1d7cd538feab9ff16d139877f8')

# Crates are fetched under $srcdir so that the path remap below also hides
# the registry paths compiled into panic messages.
_env() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
}

prepare() {
  cd "$pkgname-$pkgver"
  _env
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  _env
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  _env
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/bticino-easykit "$pkgdir/usr/bin/bticino-easykit"
  install -Dm755 target/release/bticino-easykit-gui "$pkgdir/usr/bin/bticino-easykit-gui"
  install -Dm644 packaging/linux/bticino-easykit.desktop "$pkgdir/usr/share/applications/bticino-easykit.desktop"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icons/bticino-easykit-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/bticino-easykit.png"
  done
  install -Dm644 assets/icons/bticino-easykit.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/bticino-easykit.svg"
  install -Dm644 LICENSE THIRD-PARTY-LICENSES.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md docs/PROTOCOL.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
