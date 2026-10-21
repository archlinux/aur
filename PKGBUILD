# Maintainer: SprobbyBlongo <sprobbyblongo@protonmail.com>
pkgname=tinyxbox360backupmanager-git
_pkgname=TinyXbox360BackupManager
pkgver=0.18.0.r3618.g3059f881
pkgrel=1
pkgdesc='A tiny game backup manager for the Xbox 360 (Aurora)'
arch=('x86_64')
url='https://github.com/jeanmatthieud/TinyXbox360BackupManager'
license=('GPL-3.0-only')
depends=('gcc-libs' 'fontconfig' 'hicolor-icon-theme' 'libxkbcommon' 'wayland' 'libx11' 'libglvnd')
makedepends=('git' 'cargo' 'lld')
# makepkg's default CFLAGS include -flto, which makes ring's C/asm objects
# unreadable to the Rust linker (lld). Rust packages must disable it.
options=('!lto')
optdepends=('xdg-desktop-portal: native file picker dialogs')
provides=('tinyxbox360backupmanager')
conflicts=('tinyxbox360backupmanager')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.g%s' \
    "$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen -p txbm-gui
}

package() {
  cd "$_pkgname"

  # the crate is called txbm-gui, so that's the binary name
  install -Dm755 target/release/txbm-gui "$pkgdir/usr/bin/tinyxbox360backupmanager"

  install -Dm644 assets/TinyXbox360BackupManager-256x256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/tinyxbox360backupmanager.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/tinyxbox360backupmanager.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=TinyXbox360BackupManager
Comment=A tiny game backup manager for the Xbox 360 (Aurora)
Exec=tinyxbox360backupmanager
Icon=tinyxbox360backupmanager
Terminal=false
Categories=Utility;
EOF

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
