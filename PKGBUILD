# Maintainer: papacasper <chj1axr0 at gmail dot com>
# Source of truth: https://github.com/papacasper/rokast/tree/main/packaging/aur (playbooks/release.md, "AUR").
pkgname=rokast-git
pkgver=0.8.0.r0.gc3db858
pkgrel=1
pkgdesc='Mirror your Linux screen to a Roku TV over native Miracast, with nothing installed on the TV (git main)'
arch=(x86_64)
options=(!lto)   # makepkg's LTO builds ring's C code as GCC bitcode, which rustc's linker (lld) cannot read
url='https://github.com/papacasper/rokast'
license=(MIT)
# ffmpeg iw dhcpcd wpa_supplicant(wpa_cli) sudo openssh(ssh-keygen) are run as commands, so namcap calls them "may not be needed": they are.
depends=(ffmpeg iw dhcpcd wpa_supplicant sudo openssh libnl openssl gtk4 glib2 libgcc glibc hicolor-icon-theme)
makedepends=(cargo git)
optdepends=('xorg-xrandr: mirror one monitor on X11 instead of the whole X screen'
            'libpulse: send audio (pactl finds the audio output to capture)'
            'gstreamer: Wayland capture'
            'gst-plugins-base: Wayland capture'
            'gst-plugin-pipewire: Wayland capture'
            'xdg-desktop-portal: Wayland capture')
provides=(rokast)
conflicts=(rokast)
source=('rokast::git+https://github.com/papacasper/rokast.git'
        'https://w1.fi/releases/wpa_supplicant-2.11.tar.gz')
sha256sums=('SKIP'
            '912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a')

pkgver() {
  cd rokast
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd rokast
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path ui/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd rokast
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=ui/target
  cargo build --frozen --release --manifest-path ui/Cargo.toml
  CARGO_TARGET_DIR=target cargo build --frozen --release -p rokast
  ROKAST_HOSTAP_SRC="$srcdir/wpa_supplicant-2.11" ROKAST_SUPPLICANT_DIR="$srcdir/supplicant" scripts/build-supplicant
}

check() {
  cd rokast
  export RUSTUP_TOOLCHAIN=stable
  CARGO_TARGET_DIR=target cargo test --frozen --release --workspace
  CARGO_TARGET_DIR=ui/target cargo test --frozen --release --manifest-path ui/Cargo.toml
}

package() {
  cd rokast
  packaging/stage "$pkgdir" "$srcdir/supplicant"
  mv "$pkgdir/usr/share/licenses/rokast" "$pkgdir/usr/share/licenses/$pkgname"   # namcap wants it under $pkgname
}
