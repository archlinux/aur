# Maintainer: Axel Valens (chomiam) <axel.valens@gmail.com>
pkgname=noos-win-installer
pkgver=0.1.3
pkgrel=1
pkgdesc="Modern Bootable USB Creator for Linux (DD) & Windows 10/11 UEFI with Unattended Debloat Studio (Rust + Tauri v2)"
arch=('x86_64')
url="https://github.com/Chomiam/noos_win_installer"
license=('MIT')
provides=('noos-flasher')
conflicts=('noos-flasher')
depends=(
  'cairo'
  'dosfstools'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'ntfs-3g'
  'pango'
  'parted'
  'polkit'
  'util-linux'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'git'
  'pkgconf'
)
optdepends=(
  '7zip: Fast ISO internal metadata probing (7z)'
)
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Chomiam/noos_win_installer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1bc2f8d3c44520a9ff7babfd37bbea7dbb678cff8b0714612a8ee3380c977466')

prepare() {
  cd "${srcdir}/noos_win_installer-${pkgver}/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/noos_win_installer-${pkgver}/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/noos_win_installer-${pkgver}/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --lib
}

package() {
  cd "${srcdir}/noos_win_installer-${pkgver}"
  install -Dm755 "src-tauri/target/release/noos-win-installer" "${pkgdir}/usr/bin/noos-win-installer"
  ln -sf "/usr/bin/noos-win-installer" "${pkgdir}/usr/bin/noos-flasher"
  install -Dm644 "packaging/noos-win-installer.desktop" "${pkgdir}/usr/share/applications/noos-win-installer.desktop"
  install -Dm644 "src-tauri/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/noos-win-installer.png"
  install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/noos-win-installer.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/noos-win-installer.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
