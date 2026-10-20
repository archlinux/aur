# Maintainer: Pink Pixel <admin@pinkpixel.dev>

pkgname=purrtop
pkgver=1.0.0
pkgrel=1
pkgdesc='A colorful system monitor and task manager for Linux'
arch=('x86_64')
url='https://github.com/pinkpixel-dev/purrtop'
license=('Apache-2.0')
depends=(
  'freetype2'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'polkit'
  'systemd'
  'vulkan-driver'
  'vulkan-icd-loader'
  'wayland'
)
makedepends=('cargo' 'git')
# makepkg's C LTO breaks wayland-backend's C shim (undefined wl_log_trampoline_to_rust_client).
options=('!lto')
optdepends=(
  'elfutils: create process samples (eu-stack)'
  'glib2: Move to Trash on the Disk Space page (gio)'
  'hwdata: GPU names'
  'iproute2: find hidden port owners (ss)'
  'iw: Wi-Fi details on System Info'
  'nvidia-utils: NVIDIA details (NVML)'
)
source=("git+https://github.com/pinkpixel-dev/purrtop.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/purrtop "$pkgdir/usr/bin/purrtop"
  install -Dm755 target/release/purrtop-helper "$pkgdir/usr/lib/purrtop/purrtop-helper"
  install -Dm644 data/dev.pinkpixel.purrtop.policy "$pkgdir/usr/share/polkit-1/actions/dev.pinkpixel.purrtop.policy"
  install -Dm644 data/dev.pinkpixel.Purrtop.desktop "$pkgdir/usr/share/applications/dev.pinkpixel.Purrtop.desktop"
  for icon in data/icons/hicolor/*/apps/dev.pinkpixel.Purrtop.png; do
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/${icon#data/icons/}"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
