# Maintainer: Renan Biegelmeyer <renan.biegel@gmail.com>
pkgname=hydra-ade-git
_pkgname=hydra
pkgver=0.1.0.r75.ga76d0fc
pkgrel=2
pkgdesc="Autonomous Development Environment for parallel AI agent fleets (Tauri v2 + Rust Core)"
arch=('x86_64')
url="https://github.com/renanbs/hydra"
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'git'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
optdepends=(
  'ripgrep: accelerated file and text search in workspace explorer'
)
makedepends=(
  'cargo'
  'git'
  'nodejs'
  'pnpm'
  'rust'
)
provides=('hydra-ade')
conflicts=('hydra-ade' 'hydra')
source=("git+https://github.com/renanbs/hydra.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  pnpm install --frozen-lockfile
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="src-tauri/target"

  pnpm build
  cd src-tauri
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Executavel principal e symlink alternativo
  install -Dm755 "src-tauri/target/release/hydra" "${pkgdir}/usr/bin/hydra"
  ln -sf /usr/bin/hydra "${pkgdir}/usr/bin/hydra-ade"

  # Desktop Entry
  install -Dm644 "packaging/hydra.desktop" "${pkgdir}/usr/share/applications/hydra.desktop"

  # Icones hicolor e pixmaps
  install -Dm644 "src-tauri/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/hydra.png"
  install -Dm644 "src-tauri/icons/64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/hydra.png"
  install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/hydra.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hydra.png"
  install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/pixmaps/hydra.png"

  # Licenca MIT
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
