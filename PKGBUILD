# Maintainer: Renan Biegelmeyer <renan.biegel@gmail.com>
# Pacote estável: compila o tarball da release (versionado), não o git.
pkgname=hydra-ade
_pkgname=hydra
pkgver=0.2.2
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
conflicts=('hydra-ade-git' 'hydra')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/renanbs/hydra/archive/refs/tags/v${pkgver}.tar.gz")
# Atualizar a cada release: `updpkgsums` gera o hash do tarball.
sha256sums=('a84f096c1fe99dd62e9f61e970644f886b8efab10295673b8d4bc75d7197e1aa')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  pnpm install --frozen-lockfile
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="src-tauri/target"

  pnpm build
  cd src-tauri
  cargo build --release --locked --offline || cargo build --release --offline
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "src-tauri/target/release/hydra" "${pkgdir}/usr/bin/hydra"
  ln -sf /usr/bin/hydra "${pkgdir}/usr/bin/hydra-ade"

  install -Dm644 "packaging/hydra.desktop" "${pkgdir}/usr/share/applications/hydra.desktop"

  install -Dm644 "src-tauri/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/hydra.png"
  install -Dm644 "src-tauri/icons/64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/hydra.png"
  install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/hydra.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hydra.png"
  install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/pixmaps/hydra.png"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
