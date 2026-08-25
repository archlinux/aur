pkgname=biject
pkgver=0.5.0
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
sha256sums=('a66ff721239a6023bfc7cf08ed1a1cc6ab8886fcbc6bc5dbabdbad1601117c07'
            '87fde921a0aedc0b807ff0b9acdb3692fc1b89324a2b91da81faba3c525d350d')

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
  # Attribution for bundled dependencies; required by the permissive licences
  # most of them use. Shipped in the release tarball.
  install -Dm644 THIRD-PARTY-NOTICES.txt     "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.txt"
}
