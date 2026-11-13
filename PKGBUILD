# Maintainer: RamazanBerk20 <119219364+RamazanBerk20@users.noreply.github.com>
pkgname=swiftsim-git
pkgver=0.3.0.r0.g795b02f
pkgrel=1
pkgdesc='Fast SPICE circuit simulator with a schematic editor and waveform viewer (LTspice alternative; development version)'
arch=('x86_64')
url='https://github.com/RamazanBerk20/SwiftSim'
license=('MIT OR Apache-2.0' 'OFL-1.1')
depends=('gcc-libs' 'glibc' 'dbus' 'fontconfig' 'libglvnd' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'wayland')
makedepends=('cargo' 'git')
options=('!lto' '!debug')  # makepkg's GCC LTO objects from ring's C code can't be linked by rust-lld
optdepends=('vulkan-icd-loader: Vulkan rendering (OpenGL is used otherwise)'
            'xdg-desktop-portal: Open/Save dialogs'
            'zenity: Open/Save dialogs without a desktop portal')
provides=('swiftsim')
conflicts=('swiftsim')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/swiftsim -t "$pkgdir/usr/bin"
  install -Dm644 packaging/linux/swiftsim.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/swiftsim.xml -t "$pkgdir/usr/share/mime/packages"
  install -Dm644 assets/swiftsim.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/swiftsim.svg"
  for png in assets/icons/*.png; do
    s=$(basename "$png" .png)
    install -Dm644 "$png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/swiftsim.png"
  done
  install -Dm644 LICENSE-MIT LICENSE-APACHE LICENSE-OFL -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
