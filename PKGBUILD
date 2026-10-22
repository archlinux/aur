# Maintainer: Mahfuz Shaikh <mah3uz@gmail.com>

pkgname=sysman
pkgver=0.3.0
pkgrel=1
pkgdesc='System monitor for Linux: a metrics collector daemon with crash log and history, and a GPUI app'
arch=('x86_64')
url='https://github.com/mah3uz/sysman'
license=('MIT')
depends=(
  'gcc-libs' 'glibc'
  'iproute2' 'fontconfig'
  'libbpf'
  'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'libxau' 'libxdmcp'
  'wayland' 'libglvnd' 'vulkan-icd-loader'
)
makedepends=('cargo' 'clang' 'libbpf' 'librsvg')
optdepends=(
  'nvidia-utils: NVIDIA GPU metrics through NVML'
  'smartmontools: SATA drive health'
)
install=sysman.install
# makepkg's LTO turns the bundled SQLite into GCC bitcode that Rust's linker cannot read
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('81729f90203b91d46bc427810dc754e099423ff84997b8a823070d76350bf86a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release -p sysmand -p sysman -p sysman-helper
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release --workspace
}

package() {
  cd "$pkgname-$pkgver"
  dist/stage.sh target/release "$pkgdir" "$pkgname"
}
