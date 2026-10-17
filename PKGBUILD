# Maintainer: Christian Helle <christian.helle@outlook.com>

pkgname=airdash
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop dashboard for Airthings air quality monitors"
arch=('x86_64' 'aarch64')
url="https://github.com/christianhelle/airdash"
license=('MIT')
# The window and OpenGL libraries are loaded at runtime rather than linked.
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libxkbcommon' 'wayland')
makedepends=('cargo')
optdepends=(
  'libx11: run in an X11 session'
  'libxcursor: run in an X11 session'
  'libxi: run in an X11 session'
  'libxkbcommon-x11: run in an X11 session'
  'libxrender: run in an X11 session'
  'gnome-keyring: keep the Airthings sign-in in the Secret Service instead of a file'
)
conflicts=('airdash-bin')
# makepkg's LTO compiles the aws-lc-sys C code to GCC bitcode, which the Rust linker cannot read. Cargo
# still does LTO through the release profile, which also strips the binary.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa629e2edfaa69375857531cab25c255121699932ccba9e0566bfd3950d848de')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p airdash
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/airdash "$pkgdir/usr/bin/airdash"
  install -Dm644 src/airdash/assets/com.christianhelle.airdash.desktop \
    "$pkgdir/usr/share/applications/com.christianhelle.airdash.desktop"
  install -Dm644 src/airdash/assets/icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.christianhelle.airdash.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
