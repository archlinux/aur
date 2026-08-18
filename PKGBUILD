pkgname=biject
pkgver=0.3.0
pkgrel=1
pkgdesc="Schema-aware data diff tool with a Rust CLI and Tauri desktop UI"
arch=('x86_64')
url="https://github.com/vixinxiviir/biject"
license=('GPL3')
provides=('biject-gui')
# Formerly published as 'datadiff'; replaces= migrates existing installs on upgrade.
replaces=('datadiff' 'datadiff-gui')
conflicts=('biject-gui' 'biject-bin' 'biject-gui-bin' 'datadiff' 'datadiff-gui')
depends=(
  'glibc'
  'gcc-libs'
  'gtk3'
  'hicolor-icon-theme'
  'sqlite'
  'webkit2gtk-4.1'
  'libsoup3'
  'openssl'
  'librsvg'
)
makedepends=(
  'cargo'
  'rust'
  'clang'
  'cmake'
  'pkgconf'
  'sqlite'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/vixinxiviir/biject/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}-vendor-${pkgver}.tar.zst::https://github.com/vixinxiviir/biject/releases/download/v${pkgver}/${pkgname}-vendor-${pkgver}.tar.zst"
)
sha256sums=('028b76c7c0c234946788bbe41e901d278896d6c331a8fa4b556773eadfa1f82f'
            'ce46dc31ebad478f350ff6e7497a67b1e06aa9ee30e7a26aabe2c6e12eb5a827')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CARGO_TARGET_DIR="${srcdir}/target"

  tar --zstd -xf "${srcdir}/${pkgname}-vendor-${pkgver}.tar.zst" -C "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p .cargo
  cat > .cargo/config.toml <<'EOF'
[source.crates-io]
replace-with = "vendored-sources"

[source.vendored-sources]
directory = "vendor"
EOF
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CARGO_TARGET_DIR="${srcdir}/target"

  cargo build --frozen --release --locked --bin biject
  cargo build --frozen --release --locked --manifest-path tauri-app/src-tauri/Cargo.toml
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/target/release/biject" "${pkgdir}/usr/bin/biject"
  install -Dm755 "${srcdir}/target/release/biject-gui" "${pkgdir}/usr/bin/biject-gui"

  install -Dm644 packaging/aur/biject.desktop "${pkgdir}/usr/share/applications/biject.desktop"

  install -Dm644 tauri-app/src-tauri/icons/32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/biject.png"
  install -Dm644 tauri-app/src-tauri/icons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/biject.png"
  install -Dm644 tauri-app/src-tauri/icons/128x128@2x.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/biject.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
