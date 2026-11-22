# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=cachy-auto-update
pkgver=2.0.2
pkgrel=1
pkgdesc="Unattended background updates for CachyOS, aware of battery, gaming and manual package management"
arch=('x86_64' 'aarch64')
url="https://github.com/LoonixTools/cachy-auto-update"
license=('GPL-3.0-or-later')
# Rust since 2.0.0. The window and the tray icon are drawn with Rune, which
# opens its libraries by name: fontconfig, the Vulkan loader, and wayland or
# the X11 libraries, for whichever session the user is in.
# vulkan-driver: the loader alone draws nothing.
depends=('bash' 'coreutils' 'gcc-libs' 'glibc' 'pacman' 'polkit' 'procps-ng'
         'sudo' 'systemd' 'util-linux'
         'fontconfig' 'hicolor-icon-theme' 'libx11' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'vulkan-driver' 'vulkan-icd-loader'
         'wayland')
makedepends=('cargo' 'scdoc')
optdepends=('pacman-contrib: count updates ahead of time and trim the package cache'
            'paru: AUR package updates'
            'yay: AUR package updates'
            'base-devel: required to build AUR packages'
            'flatpak: Flatpak updates'
            'gearlever: AppImage updates')
backup=('etc/cachy-auto-update/cachy-auto-update.conf'
        'etc/logrotate.d/cachy-auto-update')
# !debug: upstream's release profile strips the binaries itself, so there is
# nothing left to split into a debug package.
options=('!debug')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff33f26cff6b2b0ac5586989a80048e6a083b37b39d80b1d486c8d9aa5f8fee9')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # upstream's Makefile: both programs and the man page. The version comes
  # from Cargo.toml.
  make CARGOFLAGS="--release --frozen"
}

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
