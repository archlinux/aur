# Maintainer: papacasper <chj1axr0 at gmail dot com>
# Source of truth: https://github.com/papacasper/rokast/tree/main/packaging/aur (playbooks/release.md, "AUR").
pkgname=rokast
pkgver=0.8.2
pkgrel=1
pkgdesc='Mirror your Linux screen to a Roku TV over native Miracast, with nothing installed on the TV'
arch=(x86_64)
options=(!lto)   # makepkg's LTO builds ring's C code as GCC bitcode, which rustc's linker (lld) cannot read
url='https://github.com/papacasper/rokast'
license=(MIT)
# ffmpeg iw dhcpcd wpa_supplicant(wpa_cli) sudo openssh(ssh-keygen) are run as commands, so namcap calls them "may not be needed": they are.
depends=(ffmpeg iw dhcpcd wpa_supplicant sudo openssh libnl openssl gtk4 glib2 libgcc glibc hicolor-icon-theme)
makedepends=(cargo)
optdepends=('xorg-xrandr: mirror one monitor on X11 instead of the whole X screen'
            'libpulse: send audio (pactl finds the audio output to capture)'
            'gstreamer: Wayland capture'
            'gst-plugins-base: Wayland capture'
            'gst-plugin-pipewire: Wayland capture'
            'xdg-desktop-portal: Wayland capture')
source=("$pkgname-$pkgver.tar.gz::https://github.com/papacasper/rokast/archive/v$pkgver.tar.gz"
        'https://w1.fi/releases/wpa_supplicant-2.11.tar.gz')
sha256sums=('83122d488e6b33f65cf020f42764ce2090b06f3426f787febaf12ecbd306b74f'
            '912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path ui/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=ui/target
  cargo build --frozen --release --manifest-path ui/Cargo.toml
  CARGO_TARGET_DIR=target cargo build --frozen --release -p rokast
  ROKAST_HOSTAP_SRC="$srcdir/wpa_supplicant-2.11" ROKAST_SUPPLICANT_DIR="$srcdir/supplicant" scripts/build-supplicant
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  CARGO_TARGET_DIR=target cargo test --frozen --release --workspace
  CARGO_TARGET_DIR=ui/target cargo test --frozen --release --manifest-path ui/Cargo.toml
}

package() {
  cd "$pkgname-$pkgver"
  packaging/stage "$pkgdir" "$srcdir/supplicant"
}
