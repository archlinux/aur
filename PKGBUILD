# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>
#
# The AUR package: appOFholding built from a tagged release's source. The
# release workflow writes the published copy (version and checksum filled
# in, plus .SRCINFO) into its `aur` artifact; packaging/arch/PKGBUILD builds
# from a checkout instead.

pkgname=appofholding
pkgver=0.12.2
pkgrel=1
pkgdesc='AppImage manager: menu integration, updates, launch options and sandboxing'
arch=('x86_64' 'aarch64')
url='https://github.com/asafelobotomy/appofholding'
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'bubblewrap' 'xdg-dbus-proxy' 'qt6-base' 'qt6-declarative' 'qt6-svg'
         'kirigami' 'qqc2-desktop-style' 'hicolor-icon-theme')
makedepends=('cargo' 'cmake')
optdepends=('zsync: delta updates for AppImages that publish .zsync files'
            'libnotify: desktop notifications from the background updater'
            'uq: AppImages page, update tile and app-menu actions in the uQ desktop')
# Rust does its own LTO; makepkg's C/C++ LTO flags break the cxx-qt objects.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e387c2eb5c3cae1743e046b19a928d58a427b60d0d207299da806c28a38e905')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --release --frozen --workspace
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  # 0.12.2's scan test reads /etc/hostname, which a clean build chroot doesn't have
  # (fixed on main); drop the skip once the next release is out.
  cargo test --release --frozen --workspace -- --skip a_missing_scanner_or_file_is_an_error_not_a_panic
}

package() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  make install PREFIX=/usr DESTDIR="$pkgdir" PROFILE=release CARGOFLAGS=--frozen
}
