# Maintainer: RamazanBerk20 <119219364+RamazanBerk20@users.noreply.github.com>
pkgname=swiftsim
pkgver=0.1.0
pkgrel=1
pkgdesc='Fast SPICE circuit simulator with a schematic editor and waveform viewer (LTspice alternative)'
arch=('x86_64')
url='https://github.com/RamazanBerk20/SwiftSim'
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc' 'dbus' 'fontconfig' 'libglvnd' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'wayland')
makedepends=('cargo')
options=('!lto')  # makepkg's GCC LTO objects from ring's C code can't be linked by rust-lld
optdepends=('vulkan-icd-loader: Vulkan rendering (OpenGL is used otherwise)'
            'xdg-desktop-portal: Open/Save dialogs'
            'zenity: Open/Save dialogs without a desktop portal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('77d1b2a959f831cad85f8f01cb4119e37de3046bdf17c0d223acd1b56b8c9a2f')

prepare() {
  cd "SwiftSim-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "SwiftSim-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  # the app reports this version and uses it for its update notice
  export SWIFTSIM_VERSION="v$pkgver"
  cargo build --frozen --release
}

check() {
  cd "SwiftSim-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target SWIFTSIM_VERSION="v$pkgver"
  cargo test --frozen --release
}

package() {
  cd "SwiftSim-$pkgver"
  install -Dm755 target/release/swiftsim -t "$pkgdir/usr/bin"
  install -Dm644 packaging/linux/swiftsim.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/swiftsim.xml -t "$pkgdir/usr/share/mime/packages"
  install -Dm644 assets/swiftsim.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/swiftsim.svg"
  for png in assets/icons/*.png; do
    s=$(basename "$png" .png)
    install -Dm644 "$png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/swiftsim.png"
  done
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
